pkgname=bandwidth
pkgver=1.10.1
pkgrel=1
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.php"
license=('GPL')
makedepends=('nasm')
options=(!makeflags)
sha256sums=('b6bc9afbf7013488adb5001ce6d7329196c899e212a88a253bf63cb8e2348c69')
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
