pkgname=bandwidth
pkgver=1.9.3
pkgrel=1
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.html"
license=('GPL')
makedepends=('nasm')
options=(!makeflags)
sha256sums=('04a99f9acff8d2766ba35acd641ad97f7c013d9c8ae14338a560aa351f16fb7e')
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
