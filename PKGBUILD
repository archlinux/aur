# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Jason Chu <jason at archlinux dot org>
# Contributor: Thomas Zervogiannis <tzervo at gmail dot com>
# Contributor: Pedro Martinez-Julia <pedromj at um dot es>

pkgname=eboard
pkgver=1.1.3
pkgrel=1
pkgdesc="A chess interface to ICS and chess engines"
url="http://www.bergo.eng.br/eboard/"
arch=('i686' 'x86_64')
depends=('gtk2' 'libpng' 'gstreamer')
makedepends=('perl')
license=('GPL')
#source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2/download)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/fbergo/eboard/archive/v${pkgver}.tar.gz
	'eboard.desktop'
	'eboard.png')
md5sums=('9b9c5b0a5b4d9a2596c81088a89d1fd2'
         '9c933f467c8482624fa9f9e56901b456'
         '2cf1bd8f4623be7540c0f2386baf355e')

build() {
   cd ${pkgname}-${pkgver}
   ./configure --prefix=/usr --man-prefix=/usr/share/man --extra-libs=dl
   make
}   

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/{pixmaps,applications}
  install -m644 "${srcdir}"/eboard.desktop "${pkgdir}"/usr/share/applications
  install -m644 "${srcdir}"/eboard.png "${pkgdir}"/usr/share/pixmaps
}
