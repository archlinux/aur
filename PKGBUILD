pkgname=qmarineplatformtheme6
_conflictpkgname=qt6ct
_pkguntar=qmarinetheme
pkgver=0.3.0
pkgrel=1
pkgdesc="Another qt6ct for qt6, use toml as config"
url="https://github.com/Decodetalkers/qmarinetheme"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('git' 'ninja' 'cmake' 'tomlplusplus')
depends=('kconfig' 'qt6-base' 'kconfigwidgets' 'kiconthemes')
provides=("$_conflictpkgname")
conflicts=("$_conflictpkgname")
sha256sums=('7958d6cbe7a0c1d5fdc8760078a74eec770660d6212c511ae1599fc7c1dfaa6e')
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
