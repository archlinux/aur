# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_uuid=blur-my-shell@aunetx
pkgver=65
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/aunetx/blur-my-shell.git#tag=v$pkgver")
sha256sums=('7cfdc04ae33e159b187be1a861f38ae5d4c95470ee9309d8b63a048e2c53177f')

build() {
  cd blur-my-shell
  make
}

package() {
  cd blur-my-shell
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" \
    -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
