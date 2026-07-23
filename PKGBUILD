# Maintainer: yummiergravy <https://github.com/YummierGravy>

pkgname=plasma-lichess-tv-wallpaper
pkgver=0.3.0
pkgrel=1
pkgdesc="Unofficial Plasma 6 live wallpaper for Lichess TV"
arch=('x86_64')
url="https://github.com/YummierGravy/plasma-lichess-tv-wallpaper"
license=('GPL-3.0-or-later' 'GPL-2.0-or-later' 'Apache-2.0')
depends=(
  'plasma-workspace'
  'kwin'
  'libplasma'
  'kirigami'
  'kconfig'
  'kcoreaddons'
  'kdbusaddons'
  'ki18n'
  'kpackage'
  'kwindowsystem'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)
provides=('plasma-lichess-tv-wallpaper')
conflicts=('plasma-lichess-tv-wallpaper-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3124bbe35b26cbea723a3591acae3ce9bab8a2fd64f07cdadc53a608245ef0ac')
install=${pkgname}.install

build() {
  cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
