# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>

# Remove this if building against a libadwaita version earlier than 1.2.0
CONFIG_OPTIONS=-Dadw_1_2=true

pkgname=spedread
_pkgname=Spedread
pkgver=2.3.4
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64' 'aarch64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('9313f7d9bce69a565b523f3a01506c51003597ea751fc68f182840cb905e3441287c0abf582d90708d2f7e06ab1abb3f2d17fb97fb4ecc42824d8ffce7917ff3')

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
