# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Jason Chu <jason at archlinux dot org>
# Contributor: Thomas Zervogiannis <tzervo at gmail dot com>
# Contributor: Pedro Martinez-Julia <pedromj at um dot es>

pkgname=eboard
pkgver=1.1.1
pkgrel=5
pkgdesc="A chess interface to ICS and chess engines"
url="http://www.bergo.eng.br/eboard/"
arch=('i686' 'x86_64')
depends=('gtk2' 'libpng')
makedepends=('perl')
license=('GPL')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2/download
	'eboard.desktop'
	'eboard.png'
	'gcc-4.4.patch'
	'libpng-1.5.8.patch')
md5sums=('03dcdaa2bc85218b1b18c4bee276fea7'
	'9c933f467c8482624fa9f9e56901b456'
	'2cf1bd8f4623be7540c0f2386baf355e'
	'0a4e70bcda6aaf06f4290cfbea730114'
	'8999e1c3ae7e14740c361294049c607d')

build() {
   cd "${srcdir}"/${pkgname}-${pkgver}
   patch -Np0 -i "${srcdir}"/gcc-4.4.patch
   patch -Np0 -i "${srcdir}"/libpng-1.5.8.patch
   ./configure --prefix=/usr --man-prefix=/usr/share/man --extra-libs=dl
   make
}   

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/{pixmaps,applications}
  install -m644 "${srcdir}"/eboard.desktop "${pkgdir}"/usr/share/applications
  install -m644 "${srcdir}"/eboard.png "${pkgdir}"/usr/share/pixmaps
}
