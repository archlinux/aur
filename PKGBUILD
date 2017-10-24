# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgname=mono-debugger
pkgver=2.10
pkgrel=3
pkgdesc="The Mono Debugger"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mono-project.com/"
depends=('mono>=2.10.1')
options=('!makeflags')
source=(http://download.mono-project.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('02ee485f2aae279f2fa3a7051c7d580e')

prepare() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${srcdir}/weird
  mkdir -p "${MONO_SHARED_DIR}"
  
  rm -rf build/*.dll
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
