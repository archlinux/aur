_orig_ver=1.11.2
_orig_patch=d
_orig_fullver=$_orig_ver$_orig_patch

pkgname=bandwidth
pkgver=$_orig_ver${_orig_patch:+.$_orig_patch}
pkgrel=1
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.php"
license=('GPL')
makedepends=('nasm')
options=(!makeflags !debug)
sha256sums=('ec8acd8825ca7f5bf244697bdc272edda60ca8f55ce0fa44afa9674aa21ae10f')
source=("https://zsmith.co/archives/${pkgname}-${_orig_fullver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${_orig_fullver}"

  make clean

  if [ "${CARCH}" = "x86_64" ]; then
     make -f Makefile-linux-x86_64 bandwidth64
   else
     make -f Makefile-linux-i386 bandwidth32
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${_orig_fullver}"
  if [ "${CARCH}" = "x86_64" ]; then
     install -Dm755 bandwidth64 "${pkgdir}"/usr/bin/bandwidth
   else
     install -Dm755 bandwidth32 "${pkgdir}"/usr/bin/bandwidth
  fi
}
