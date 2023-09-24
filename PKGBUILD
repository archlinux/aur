# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>

# Remove this if building against a libadwaita version earlier than 1.2.0
CONFIG_OPTIONS=-Dadw_1_2=true

pkgname=spedread
_pkgname=Spedread
pkgver=2.4.4
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64' 'aarch64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('fe7a2c7615675e67f2e571a0cad627f4af171b09874ad8cac8f2423cb5b7c28f88af43ad3d4fcc78d8c0463f53ebfaacf7f023acc0a8b83555b3738f5d3cebfa')

build() {
  arch-meson "$_pkgname-$pkgver" build $CONFIG_OPTIONS
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
