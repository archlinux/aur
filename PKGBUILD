# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=krunner-bazaar
pkgver=1.3.0
pkgrel=1
pkgdesc="KRunner plugin for bazaar"
arch=('x86_64')
url="https://github.com/ublue-os/krunner-bazaar"
license=('Apache-2.0')
depends=('qt6-base' 'krunner' 'ki18n' 'kcoreaddons' 'kconfig')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'gettext')
optdepends=('bazaar: install if not using the flatpak version')
source=("https://github.com/ublue-os/krunner-bazaar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('793f59b414973b85160573b0d8d5f8fc38bd216d106f976a3c416c86b37a0d09')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build -j$(nproc)
}

package() {
  cd "${pkgname}-${pkgver}"
  cmake --install build --prefix="$pkgdir/usr"
}
