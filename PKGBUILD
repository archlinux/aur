# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=tufao
pkgver=1.2.2
pkgrel=1
pkgdesc="An asynchronous web framework for C++ built on top of Qt"
arch=('i686' 'x86_64')
url="https://github.com/vinipsmaker/tufao"
license=('LGPL2')
depends=('qt5-base')
makedepends=('cmake')
source=("https://github.com/vinipsmaker/tufao/archive/${pkgver}.tar.gz")
md5sums=('a47d6a37cd1e858e7270eb2d692e7323')

build() {
  mkdir -p "${srcdir}/tufao-${pkgver}/build"
  cd "${srcdir}/tufao-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TESTS=ON ..
  make
}

check() {
  cd "${srcdir}/tufao-${pkgver}/build"
  make tests

  # Uncomment the following line to help Tufão development by sending info
  # about build status
  #make Experimental
}

package() {
  cd "${srcdir}/tufao-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
