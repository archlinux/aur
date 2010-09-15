#$Id: PKGBUILD 64614 2010-01-21 11:40:53Z allan $
# Maintainer: Hugo Doria <hugo@archlinux.org>

_pkgbasename=libcap
pkgname=lib32-$_pkgbasename
pkgver=2.19
pkgrel=3
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="http://www.kernel.org/pub/linux/libs/security/linux-privs/"
license=('GPL')
depends=('lib32-attr' $_pkgbasename)
makedepends=('gcc-multilib')
source=(http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('9caa6dafc9e3db4cbaecdb8e48f23fa2')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  make prefix=/usr lib=lib32 DESTDIR=${pkgdir} install
  chmod 755 ${pkgdir}/usr/lib32/libcap.so.${pkgver}

  rm -rf "${pkgdir}"/usr/{include,share,sbin,lib32/security}
}
