# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Co-Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=coulr
pkgver=2.2.0
pkgrel=1
pkgdesc="Color box to help developers and designers"
url="https://github.com/Huluti/Coulr"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('python-gobject' 'libadwaita' 'libportal-gtk4')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('76b688f26dc588a2b146109f5da29873e70e3a73f1f0d12bc22ed15a2c830f9a')

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
