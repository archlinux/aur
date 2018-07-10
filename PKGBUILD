# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=xcfun-pyscf
_name=xcfun
pkgver=1.x
pkgrel=1
pkgdesc="Exchange-Correlation functionals with arbitrary order derivatives (compatible to PySCF)"
arch=(i686 x86_64)
url="http://dftlibs.org/xcfun/"
license=('GPL3')
makedepends=(git cmake)
provides=(${_name}=$pkgver)
conflicts=(xcfun)
source=($pkgname::git+https://github.com/dftlibs/xcfun.git#commit=355f42497a9cd17d16ae91da1f1aaaf93756ae8b)
md5sums=('SKIP')

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=1 \
          -DXC_MAX_ORDER=3 -DXCFUN_ENABLE_TESTS=0 \
          -DCMAKE_INSTALL_PREFIX:PATH=/usr \
          ..
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
