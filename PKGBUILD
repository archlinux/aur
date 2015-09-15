# Maintainer: danitool dgcbueu at gmail.com
# Contributor: Siôn Le Roux <sinisterstuf@gmail.com>, Alessandro Biavati <abiavati@gmail.com>

pkgname=cutecom-patched
pkgver=0.22.0
pkgrel=1
pkgdesc="Cutecom graphical serial terminal, with some improvements taken from patches not officially commited"
arch=('i686' 'x86_64')
url="http://cutecom.sourceforge.net"
license=('GPL2')
depends=('qt4' 'lrzsz')
makedepends=('cmake')
conflicts=('cutecom')
source=("${url}/cutecom-${pkgver}.tar.gz"
        'improvements.diff')

md5sums=('dd85ceecf5a60b4d9e4b21a338920561'
         'd5707a9f872571d1d27f2bdffa8e8e20')

prepare(){
	cd ${srcdir}/cutecom-${pkgver}
	patch -p1 -i ../improvements.diff
}
         
build() {
	cd ${srcdir}/cutecom-${pkgver}
	cmake -DQT_QMAKE_EXECUTABLE=qmake4 .
	make || return 1
}

package() {
	cd ${srcdir}/cutecom-${pkgver}
	install -D -m 644 cutecom.desktop ${pkgdir}/usr/share/applications/cutecom.desktop
	install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
	install -D -m 644 cutecom.1 ${pkgdir}/usr/share/man/man1/cutecom.1
}
