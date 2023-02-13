# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>

# Remove this if building against a libadwaita version earlier than 1.2.0
CONFIG_OPTIONS=-Dadw_1_2=true

pkgname=spedread
_pkgname=Spedread
pkgver=2.3.3
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64' 'aarch64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('f5d0afc4ea116f297f10519abe659a1f464d06b70618381b3fdc82c25ae7bd62c7b8bcdf36813edbb140187144af489bd11b24217ab4074152f0598a58a90538')

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
