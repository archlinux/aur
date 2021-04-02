# Maintainer: lmartinez-mirror
pkgname=thermofun-git
pkgver=0.3.7.r0.gf4da39b
pkgrel=1
pkgdesc="Library for calculating standard state thermodynamic properties"
arch=('x86_64')
url="https://github.com/thermohub/thermofun"
license=('LGPL3')
depends=('gcc-libs' 'python')
makedepends=('git' 'cmake' 'nlohmann-json' 'pybind11' 'python-setuptools')
provides=('thermofun' 'libThermoFun.so')
conflicts=('thermofun')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_SKIP_RPATH=YES \
    -S "$pkgname" \
    -B build
  make -C build
}

package() {
  make install -C build
}
