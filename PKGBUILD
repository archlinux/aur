# Maintainer: Ashish Singh <ashish.singh1@live.in>

pkgname=boost175
pkgver=1.75.0
pkgrel=1
_srcname=boost_${pkgver//./_}
pkgdesc="Free peer-reviewed portable C++ source libraries (version 1.75)"
url="https://www.boost.org"
license=('BSL-1.0')
depends=('gcc-libs')
# optdepends=()
makedepends=('icu' 'openmpi')
arch=('any')
source=("https://archives.boost.io/release/$pkgver/source/$_srcname.tar.gz")
md5sums=('SKIP')

_basedir=/opt/swig-4.0.2

build() {
  cd "$srcdir/${_srcname}"
  # echo "using mpi ;" > $srcdir/user-config.jam
  # export BOOST_BUILD_PATH="$srcdir"
  ./bootstrap.sh --prefix=/opt/boost-${pkgver}
  ./b2 --without-mpi --without-python link=shared runtime-link=shared variant=release -j$(nproc)
}

package() {
  cd "$srcdir/${_srcname}"
  ./b2 install --without-mpi --without-python link=shared runtime-link=shared variant=release --prefix=$pkgdir/opt/boost-${pkgver}
}
