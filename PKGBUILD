# $Id$
# Maintainer: Ryotaro Ko <aur AT p1kachu DOT net>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Fabien Wang <fabien(dot)wang(at)gmail(dot)com>

pkgname=qt4pas
pkgver=2.5
pkgrel=9
pkgdesc="Free Pascal Qt4 Binding Library"
arch=('x86_64')
url="http://users.telenet.be/Jan.Van.hijfte/qtforfpc/fpcqt4.html"
license=('LGPL')
depends=('qt4' 'xdg-utils')
source=(
    'https://github.com/pikatenor/qt4pas/archive/refs/tags/V2.5_Qt4.5.3.tar.gz'
    'qtwebkit.patch'
)
sha256sums=('119a4078c9933e94a3202dfdd46a44172a9098cbc0240491592071fe831761da'
            'af1721fbf6706931d0b82dd28b3540f56a65e1585b75873c4ac9eaddecf9c921')

prepare() {
	cd "qt4pas-2.5_Qt4.5.3/"

    patch -p0 -i "$srcdir/qtwebkit.patch"
}

build() {
	cd "qt4pas-2.5_Qt4.5.3/"

	qmake-qt4 -query
	qmake-qt4
	make
}

package() {
	cd "qt4pas-2.5_Qt4.5.3/"

	INSTALL_ROOT="$pkgdir" make install

	pushd "$pkgdir/usr/lib"
	for intflink in 'libqt4intf.so' 'libqt4intf.so.5' 'libqt4intf.so.5.2' 'libqt4intf.so.5.2.1' 'libqt4intf.so.5.2.5'; do
		ln -s libQt4Pas.so.5.2.5 $intflink
	done
	popd
}
