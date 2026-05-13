# Maintainer: Devel <Denislav08@proton.me>
# Co-Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Hugo Posnic <hugo.posnic@gmail.com>


pkgname=coulr
pkgver=2.3.1
pkgrel=1
pkgdesc="Color box to help developers and designers"
url="https://github.com/Huluti/Coulr"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('python-gobject' 'libadwaita' 'libportal-gtk4')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d2515588de76be41c5ca9893c5d30bbac3a627e52f37c8037c01e40c265e40f4')

build() {
  arch-meson Coulr-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs ||:
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd Coulr-$pkgver
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/coulr"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/coulr"
}
