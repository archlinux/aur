# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keytouch-editor
pkgver=3.2.0_beta
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="An utility to create keyboard files for keytouch"
arch=('i686' 'x86_64')
url="http://keytouch.sourceforge.net/"
license=('GPL')
depends=('gtk2')
install=keytouch-editor.install
source=("http://prdownloads.sourceforge.net/keytouch/$pkgname-${_pkgver}.tar.gz" sockets.diff)
md5sums=('4f0578107d92f203785c48f7c9fa0b15'
         '2211fcc8d42436436600a37e7d0a514c')
sha1sums=('8d5fe9c905e6747a55ac41631172d6d57125e0ae'
          '160cb740e4022daf09d576078865e0c482dd17ed')

prepare () {
  cd "${srcdir}/${pkgname}-${_pkgver}/"
  patch -p1 < $srcdir/sockets.diff
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}/"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
