# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>

# Remove this if building against a libadwaita version earlier than 1.2.0
CONFIG_OPTIONS=-Dadw_1_2=true

pkgname=spedread
_pkgname=Spedread
pkgver=2.4.0
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64' 'aarch64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('f9b27cacdfbaa63ef15ad2339a4c291fd310a781c738ab4873b49655192ea45c2f78a7e7766c89536257b03cb4d058c17bfd8913e3b31ecadf73a02e6421b598')

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
