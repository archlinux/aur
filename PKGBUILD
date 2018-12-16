# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

_pkgname=libarchive
pkgname=lib32-${_pkgname}
pkgver=3.3.3
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats (32 bit)"
arch=('x86_64')
url="http://libarchive.org"
license=('BSD')
depends=('lib32-acl' 'lib32-bzip2' 'lib32-expat' 'lib32-lzo' 'lib32-openssl' 'lib32-xz' "${_pkgname}")
makedepends=('gcc-multilib' 'lib32-zlib')
source=("http://libarchive.org/downloads/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('9d12b47d6976efa9f98e62c25d8b85fd745d4e9ca7b7e6d36bfe095dfe5c4db017d4e785d110f3758f5938dad6f1a1b009267fd7e82cb7212e93e1aea237bab7')

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
