# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

_pkgname=libarchive
pkgname=lib32-${_pkgname}
pkgver=3.3.1
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats (32 bit)"
arch=('x86_64')
url="http://libarchive.org"
license=('BSD')
depends=('lib32-acl' 'lib32-bzip2' 'lib32-expat' 'lib32-lzo' 'lib32-openssl' 'lib32-xz' "${_pkgname}")
makedepends=('gcc-multilib' 'lib32-zlib')
source=("http://libarchive.org/downloads/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d2af45480aa5b0db5b5f3919cd0ea65e')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --without-xml2 --libdir=/usr/lib32 \
              --without-nettle --libexecdir="/usr/lib32/${_pkgname}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
