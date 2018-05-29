pkgname=bandwidth
pkgver=1.5.1
pkgrel=1
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.html"
license=('GPL')
makedepends=('nasm')
options=(!makeflags)
sha256sums=('2b9e48aec2270c826c36de85a6f904c6c5c410c28f291ff760704d1a850a33ed')
source=("https://zsmith.co/archives/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make clean

  if [ "${CARCH}" = "x86_64" ]; then
     make bandwidth64
   else
     make bandwidth32
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
