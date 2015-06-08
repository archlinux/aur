# $Id: PKGBUILD 168008 2012-10-05 06:33:28Z eric $
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>
# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=lib32-libshout
_pkgname=libshout
pkgver=2.3.1
pkgrel=2
pkgdesc="Library for accessing a shoutcast/icecast server, lib32"
arch=('x86_64')
depends=('lib32-libvorbis' 'lib32-libtheora' 'lib32-speex' 'libshout')
url="http://www.icecast.org/"
options=('!emptydirs')
license=('LGPL')
source=("http://downloads.xiph.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('11765b2592e7ea623ccd93d3f8df172c')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cd "$pkgdir/usr/"
  rm -rf {include,share}/
}
