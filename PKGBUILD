pkgname=qmarineplatformtheme5
_conflictpkgname=qt5ct
_pkguntar=qmarinetheme
pkgver=0.2.0
pkgrel=1
pkgdesc="Another qt5ct for qt5, use toml as config"
url="https://github.com/Decodetalkers/qmarinetheme"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('git' 'ninja' 'cmake' 'tomlplusplus' 'kconfig5' 'kconfigwidgets5' 'kiconthemes5')
depends=('kconfig5' 'qt5-base' 'kconfigwidgets5' 'kiconthemes5')
provides=("$_conflictpkgname")
conflicts=("$_conflictpkgname")
sha256sums=('cf40d7a23f49f6c7cbdf33baf5be68406d731d3edafe7b12bee08cd13e327858')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/qmarinetheme/archive/refs/tags/v${pkgver}.tar.gz")
build() {
  cd ${_pkguntar}-$pkgver
  cmake -GNinja \
        -DQT_PLUGIN_DIR=/usr/lib/qt/plugins/ \
        -DQT_VERSION=5 \
        -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd ${_pkguntar}-$pkgver
  DESTDIR="$pkgdir" ninja install
}
