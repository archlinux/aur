pkgname=qmarineplatformtheme5
_conflictpkgname=qt5ct
_pkguntar=qmarinetheme
pkgver=0.1.1
pkgrel=2
pkgdesc="Another qt5ct for qt5, use toml as config"
url="https://github.com/Decodetalkers/qmarinetheme"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('git' 'ninja' 'cmake' 'tomlplusplus' 'kconfig' 'kconfigwidgets' 'kiconthemes')
depends=('kconfig' 'qt5-base' 'kconfigwidgets' 'kiconthemes')
provides=("$_conflictpkgname")
conflicts=("$_conflictpkgname")
sha256sums=('f7331f0c7e5f0c1b1f66a278baa9f1da0556bd83f13899e7a7e4ca32f1f7a2a3')
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
