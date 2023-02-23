# Maintainer: Mauricio Morales <mocomauricio@gmail.com>

pkgname=xmmplayer
pkgver=0.3.3
pkgrel=1
pkgdesc="plugin for XMMS that allows you to play video files from within XMMS using MPlayer as a back-end"
arch=('x86_64')
url="https://www.xmms.org"
license=('GPL')
depends=('xmms' 'mplayer')
makedepends=('python2')
source=(https://manualinux.eu/archivos/$pkgname-$pkgver.tar.bz2
    https://manualinux.eu/parches/$pkgname-${pkgver}_MKV.diff)

md5sums=('4103a72283590474a98fe6ab60439efe'
         'f02ff73c496d0b5d3d51525fcd3e53bb')

prepare() {
	cd xmmplayer-${pkgver}
	patch -Np1 -i ../xmmplayer-${pkgver}_MKV.diff
	python2 ./autogen.py
}

build() {
	cd xmmplayer-${pkgver}
  	./configure --prefix=/usr
  	make
}

package() {
	cd xmmplayer-${pkgver}
	make DESTDIR="${pkgdir}" install-strip
}
