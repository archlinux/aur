pkgname=bandwidth
pkgver=1.1b
pkgrel=1
pkgdesc="Benchmark memory and network bandwidth"
arch=('i686' 'x86_64')
url="http://home.comcast.net/~veritas/bandwidth.html"
license=('GPL')
makedepends=('nasm')
options=(!makeflags)
source=(http://zsmith.co/archives/${pkgname}-${pkgver}.tar.gz)
md5sums=('ae47329daea5c422f552e38b16856376') 

build() {
  cd "${srcdir}"/${pkgname}-1.1
  if [ "${CARCH}" = "x86_64" ]; then 
     make bandwidth64
   else
     make bandwidth32
  fi
}

package() {
  cd "${srcdir}"/${pkgname}-1.1
  if [ "${CARCH}" = "x86_64" ]; then 
     install -Dm755 bandwidth64 "${pkgdir}"/usr/bin/bandwidth
   else
     install -Dm755 bandwidth32 "${pkgdir}"/usr/bin/bandwidth
  fi
}
