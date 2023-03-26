# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_pkgname=blur-my-shell
pkgver=45
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5cf537e286b03f7873c0be5016c210ead05c1aea19ed1522a27481f734d5fb6a')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  _uuid="${_pkgname}@aunetx"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf build/${_uuid}.shell-extension.zip \
    -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 "schemas/org.gnome.shell.extensions.${_pkgname}.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
