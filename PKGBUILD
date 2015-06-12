# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=gmrun-multihead
_programname=gmrun
provides='gmrun'
conflicts=('gmrun' 'gmrun-xdg')
pkgver=0.9.2
pkgrel=2
pkgdesc="A simple program which provides a run program window"
arch=('i686' 'x86_64')
url="http://sf.net/projects/gmrun"
license=('GPL')
depends=('gtk2' 'popt')
source=("http://downloads.sourceforge.net/${_programname}/${_programname}-$pkgver.tar.gz"
        "gcc43.patch"
        "center-and-multihead.patch")
md5sums=('6cef37a968006d9496fc56a7099c603c'
         '3a0b69d8c2cac6cfb551b9d235441ecb'
         '11bcdeb1a0618f13545c0a127a25114f')

build() {
	cd "${srcdir}/${_programname}-${pkgver}"

	patch -p0 -i "${srcdir}/gcc43.patch"
	patch -p0 -i "${srcdir}/center-and-multihead.patch"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_programname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
} 
