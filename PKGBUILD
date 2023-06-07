pkgname=qmarineplatformtheme5
_conflictpkgname=qt5ct
_pkguntar=qmarinetheme
pkgver=0.1.0
pkgrel=2
pkgdesc="Another qt5ct for qt5, use toml as config"
url="https://github.com/Decodetalkers/qmarinetheme"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('git' 'ninja' 'cmake' 'tomlplusplus' 'kconfig' 'kconfigwidgets' 'kiconthemes')
depends=('kconfig' 'qt5-base' 'kconfigwidgets' 'kiconthemes')
provides=("$_conflictpkgname")
conflicts=("$_conflictpkgname")
sha256sums=('c9c5fd12bc3962c23dc22d4d79ff4ec2135320be3a074117094357abffde41bd')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/qmarinetheme/archive/refs/tags/v${pkgver}.tar.gz")
build() {
  cd ${_pkguntar}-$pkgver
  cmake -GNinja \
        -DQT_PLUGIN_DIR=/usr/lib/qt/plugins/ \
				-DQT_VERSION=5 \
        -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd ${_pkguntar}-$pkgver
  DESTDIR="$pkgdir" ninja install
}
