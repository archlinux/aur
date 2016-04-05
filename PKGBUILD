pkgname=bandwidth
pkgver=1.2.1
pkgrel=1
pkgdesc="Benchmark memory and network bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.html"
license=('GPL')
makedepends=('nasm')
options=(!makeflags)
sha1sums=('93a408a667d6dcf7fd5f33cea4b24c4cea5c89bc')
source=("https://mutineer.org/file.php?id=${sha1sums[0]}&p=${pkgname}")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make clean

  if [ "${CARCH}" = "x86_64" ]; then 
     make bandwidth64
   else
     make bandwidth32
  fi
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  if [ "${CARCH}" = "x86_64" ]; then 
     install -Dm755 bandwidth64 "${pkgdir}"/usr/bin/bandwidth
   else
     install -Dm755 bandwidth32 "${pkgdir}"/usr/bin/bandwidth
  fi
}
