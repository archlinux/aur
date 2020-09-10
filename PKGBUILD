pkgname=bandwidth
pkgver=1.9.4
pkgrel=1
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.php"
license=('GPL')
makedepends=('nasm')
options=(!makeflags)
sha256sums=('44f32f6a4afb5a0b39a6dec471a9f20712ac45727503aaa0c03cc23d6447e974')
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
