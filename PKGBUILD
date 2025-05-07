# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=stlsplit
pkgver=1.2
pkgrel=2
pkgdesc="Split STL file to more files - one shell each"
arch=('i686' 'x86_64')
url="https://github.com/admesh/stlsplit/"
license=('GPL3')
depends=('gcc-libs' 'admesh')
makedepends=('premake')
source=("https://github.com/admesh/${pkgname}/archive/v${pkgver}.tar.gz"
        "premake5.lua")
md5sums=('95e037365bf695405274620fe8edab5e'
         'f24db41786ab9318b54f041c825a5d47')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cp "${srcdir}"/premake5.lua .
  premake5 gmake
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 -t ${pkgdir}/usr/bin build/stlsplit
  install -Dm755 -t ${pkgdir}/usr/lib build/libstlsplit.so.1
  install -Dm644 -t ${pkgdir}/usr/include stlsplit.h
  ln -s libstlsplit.so.1 ${pkgdir}/usr/lib/libstlsplit.so
}

# vim:set ts=2 sw=2 et:
