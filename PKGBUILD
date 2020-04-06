# Contributor: Alexandr Parkhomenko <it@52tour.ru>
# 33M    http://getdp.info/bin/Linux/getdp-3.3.0-Linux64c.tgz 
# 2.7M   this

pkgname=getdp
pkgver=3.3.0
pkgrel=1
pkgdesc='A General Environment for the Treatment of Discrete Problems'
arch=('x86_64')
url='http://getdp.info/'
license=('LGPL3')

depends=('python'
'gmsh'
)
 
makedepends=('gcc' 'gcc-libs' 'cmake' 'git'
'arpack' 'openblas' 'lapack' 'swig'
'flex' 'bison'
'texinfo'
# gcc-fortran Kernel PeWe SparskitZ
)

# source=("$pkgname::git+https://gitlab.onelab.info/$pkgname/$pkgname")
source=("http://$pkgname.info/src/$pkgname-$pkgver-source.tgz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver-source"
  sed -i '1i #include <cstring>' Kernel/Operation_Broadcast.cpp
}

#pkgver() {
#  cd "${srcdir}/$pkgname-$pkgver-source"
#  ( set -o pipefail
#    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#  )
#}

build() {
    cd "${startdir}"
    if [ ! -d "build/$pkgname-$pkgver" ]; then
        mkdir -p build/$pkgname-$pkgver;
    fi
    cd build/$pkgname-$pkgver
    cmake "${srcdir}/$pkgname-$pkgver-source" \
      -DCMAKE_INSTALL_PREFIX="/usr" 
    make
}

package() {
    cd "${startdir}/build/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

