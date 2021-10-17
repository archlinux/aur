pkgname=bandwidth
pkgver=1.10.4
pkgrel=1
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.php"
license=('GPL')
makedepends=('nasm')
options=(!makeflags !debug)
sha256sums=('7bf78fdab03b12516b876678a93cd1191fdcc58d5423ab3e2d0f4e835c78ebf2')
source=("https://zsmith.co/archives/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make clean

  if [ "${CARCH}" = "x86_64" ]; then
     make -f Makefile-linux-x86_64 bandwidth64
   else
     make -f Makefile-linux-i386 bandwidth32
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  if [ "${CARCH}" = "x86_64" ]; then
     install -Dm755 bandwidth64 "${pkgdir}"/usr/bin/bandwidth
   else
     install -Dm755 bandwidth32 "${pkgdir}"/usr/bin/bandwidth
  fi
}
