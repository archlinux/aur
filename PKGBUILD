# Maintainer: danitool dgcbueu at gmail.com
# Contributor: Siôn Le Roux <sinisterstuf@gmail.com>, Alessandro Biavati <abiavati@gmail.com>

pkgname=cutecom-patched
pkgver=0.22.0
pkgrel=4
pkgdesc="Cutecom graphical serial terminal, with some improvements taken from patches not officially commited"
arch=('i686' 'x86_64')
url="http://cutecom.sourceforge.net"
license=('GPL2')
depends=('qt4' 'lrzsz')
makedepends=('cmake')
conflicts=('cutecom')
source=("${url}/cutecom-${pkgver}.tar.gz"
        '00-improvements.diff'
        '01-add-ctrl_c-button.diff'
        '02-print_tab_characters_as_spaces.diff'
        '03-ui-align_text.diff')

md5sums=('dd85ceecf5a60b4d9e4b21a338920561'
         'f40edfbb1e1d1b4d9d47aa3dbfb08852'
         '4484eccc19ebda8e8a2b2b04880f60e1'
         'dc3f9831f1e5f2bed8abb761c21ffcca'
         '20aa958cdda3b900aa1c5673774d3c14')

prepare(){
	cd ${srcdir}/cutecom-${pkgver}
	patch -p1 -i ../00-improvements.diff
	patch -p1 -i ../01-add-ctrl_c-button.diff
	patch -p1 -i ../02-print_tab_characters_as_spaces.diff
	patch -p1 -i ../03-ui-align_text.diff
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
