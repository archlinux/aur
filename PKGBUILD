# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_pkgbasename=libcap
pkgname=lib32-$_pkgbasename
pkgver=2.25
pkgrel=2
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="http://www.kernel.org/pub/linux/libs/security/linux-privs/"
license=('GPL2')
depends=('lib32-attr' $_pkgbasename)
makedepends=('gcc-multilib' 'linux-api-headers')
source=(https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-${pkgver}.tar.xz)
md5sums=('6666b839e5d46c2ad33fc8aa2ceb5f77')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  make -C libcap CC="gcc -m32" prefix=/usr lib=lib32
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make -C libcap prefix=/usr lib=lib32 DESTDIR=${pkgdir} install
  chmod 755 ${pkgdir}/usr/lib32/libcap.so.${pkgver}

  rm -rf "${pkgdir}/usr/include"
}
