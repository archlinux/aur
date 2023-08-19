# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_uuid=blur-my-shell@aunetx
pkgver=47
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
source=("blur-my-shell-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('45f29cbda63ddda58ace58fc0538920d9fecadb3c73d75113663a62cb699f287')

build() {
  cd "blur-my-shell-$pkgver"
  make
}

package() {
  cd "blur-my-shell-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" \
    -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" \
    "$pkgdir/usr/share/locale/"

  install -Dm644 schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
