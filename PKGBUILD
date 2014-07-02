# $Id$
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Fabien Wang <fabien(dot)wang(at)gmail(dot)com>

pkgname=qt4pas
pkgver=2.5
pkgrel=4
pkgdesc="Free Pascal Qt4 Binding Library"
arch=('i686' 'x86_64')
url="http://users.telenet.be/Jan.Van.hijfte/qtforfpc/fpcqt4.html"
license=('LGPL')
depends=('qtwebkit')
source=("http://users.telenet.be/Jan.Van.hijfte/qtforfpc/V2.5/qt4pas-V2.5_Qt4.5.3.tar.gz")
md5sums=('8249bc17e4167e077d22c7f5fb118bb2')

build() {
	cd "$srcdir/qt4pas-V2.5_Qt4.5.3/"

	qmake-qt4 -query
	qmake-qt4
	make
}

package() {
	cd "$srcdir/qt4pas-V2.5_Qt4.5.3/"
	INSTALL_ROOT="$pkgdir" make install

	pushd "$pkgdir/usr/lib"
	for intflink in 'libqt4intf.so' 'libqt4intf.so.5' 'libqt4intf.so.5.2' 'libqt4intf.so.5.2.1' 'libqt4intf.so.5.2.5'; do
		ln -s libQt4Pas.so.5.2.5 $intflink
	done
	popd
}
