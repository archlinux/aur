# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-libshout
_pkgname=libshout
pkgver=2.4.6
pkgrel=4
epoch=1
pkgdesc="Library for accessing a shoutcast/icecast server (32 bit)"
arch=('x86_64')
depends=('lib32-libvorbis' 'lib32-libtheora' 'lib32-speex' 'lib32-openssl' 'libshout')
url="https://www.icecast.org/"
options=('!emptydirs')
license=('LGPL')
source=("https://downloads.xiph.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e8478cdbf9a27674c16a7b620d1576f2e31a47262b8e29b314d0f46d4e5be24b9a29790b7b226f48939bc34cacf5734fae0aa5686c7ed5879cdbd827ff8e0339')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/usr/{bin,include,share}
}
