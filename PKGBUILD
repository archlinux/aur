pkgname=qmarineplatformtheme6
_conflictpkgname=qt6ct
_pkguntar=qmarinetheme
pkgver=0.1.9
pkgrel=1
pkgdesc="Another qt6ct for qt6, use toml as config"
url="https://github.com/Decodetalkers/qmarinetheme"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('git' 'ninja' 'cmake' 'tomlplusplus')
depends=('kconfig' 'qt6-base' 'kconfigwidgets' 'kiconthemes')
provides=("$_conflictpkgname")
conflicts=("$_conflictpkgname")
sha256sums=('ef370d88b9b693cdc09e4cdb9bfe238a614524e39a0d6cf35df775288b155224')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/qmarinetheme/archive/refs/tags/v${pkgver}.tar.gz")
build() {
  cd ${_pkguntar}-$pkgver
  cmake . -GNinja \
        -DAS_KDE6_PLUGIN=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd ${_pkguntar}-$pkgver
  DESTDIR="$pkgdir" ninja install
}
