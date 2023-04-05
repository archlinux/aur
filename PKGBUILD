# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

_pkgname=lwp
pkgname=lib32-${_pkgname}
pkgver=2.17
pkgrel=1
pkgdesc="Lightweight process library"
arch=('x86_64')
url='https://github.com/cmusatyalab/coda'
license=("GPL")
depends=("${_pkgname}" 'lib32-glibc')
source=("coda-common::git+$url#tag=$_pkgname-$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('4EEDEE4D29DAE8A18CAFDA18BEC621B96C853813')

build() {
  cd "${srcdir}/coda-common/lib-src/${_pkgname}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  ./bootstrap.sh
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/coda-common/lib-src/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
}
