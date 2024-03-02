# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Co-Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=coulr
pkgver=2.1.0
pkgrel=1
pkgdesc="Color box to help developers and designers"
url="https://github.com/Huluti/Coulr"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('python-gobject' 'libadwaita' 'libportal-gtk4')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson Coulr build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs ||:
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd Coulr
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/coulr"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/coulr"
}
