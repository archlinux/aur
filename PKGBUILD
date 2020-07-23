# Maintainer: John Eivind Helset <jehelset@gmail.com>

pkgname=mpark-patterns-git
pkgdesc="Michael Park's C++ pattern matching library"
pkgver=0.3.0.r15.gb3270e0
pkgrel=1
arch=('any')
url='https://github.com/mpark/patterns'
licence=('Boost')
makedepends=('git' 'cmake')
source=('git+https://github.com/mpark/patterns.git')
md5sums=('SKIP')

pkgver() {
  cd patterns
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/patterns"
  rm -rf build && mkdir build 
}

build() {
  cd "${srcdir}/patterns"
  cd build
  cmake ..                                 \
        -DCMAKE_INSTALL_PREFIX='/usr'      \
        -DMPARK_PATTERNS_INCLUDE_TESTS=OFF
  make
}

package() {
    cd "${srcdir}/patterns/build"
    make DESTDIR="${pkgdir}/" install
}
