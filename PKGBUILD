#$Id: PKGBUILD 66704 2012-02-27 17:12:30Z ibiru $
# Maintainer: Hugo Doria <hugo@archlinux.org>

_pkgbasename=libcap
pkgname=libx32-$_pkgbasename
pkgver=2.22
pkgrel=1.1
pkgdesc="POSIX 1003.1e capabilities (x32 ABI)"
arch=(x86_64)
url="http://www.kernel.org/pub/linux/libs/security/linux-privs/"
license=('GPL2')
depends=('libx32-attr' $_pkgbasename)
makedepends=('gcc-multilib-x32')
source=(ftp://ftp.archlinux.org/other/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz{,.asc})
md5sums=('b4896816b626bea445f0b3849bdd4077'
         '9d0983e25e5a251d098507f9561d2b27')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  make -C libcap CC="gcc -mx32" prefix=/usr lib=libx32 DESTDIR=${pkgdir} install
  chmod 755 ${pkgdir}/usr/libx32/libcap.so.${pkgver}

  rm -rf "${pkgdir}/usr/include"
}
