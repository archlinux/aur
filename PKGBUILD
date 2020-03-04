# Mantainer: DUS462002 <daniurdi46@gmail.com>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Fabien Wang <fabien(dot)wang(at)gmail(dot)com>

pkgname=qt4pas-mirror
pkbase=qt4pas
pkgver=2.5
pkgrel=8
pkgdesc="Free Pascal Qt4 Binding Library, with sources picked from a mirror"
arch=('x86_64')
license=('LGPL')
depends=('qt4' 'xdg-utils')
provides=('qt4pas')
source=(
    'http://master.us.finkmirrors.net/distfiles/md5/8249bc17e4167e077d22c7f5fb118bb2/qt4pas-V2.5_Qt4.5.3.tar.gz'
    'qtwebkit.patch'
)
sha256sums=('SKIP'
            'af1721fbf6706931d0b82dd28b3540f56a65e1585b75873c4ac9eaddecf9c921')

prepare() {
	cd "qt4pas-V2.5_Qt4.5.3/"

    patch -p0 -i "$srcdir/qtwebkit.patch"
}

build() {
	cd "qt4pas-V2.5_Qt4.5.3/"

	qmake-qt4 -query
	qmake-qt4
	make
}

package() {
	cd "qt4pas-V2.5_Qt4.5.3/"

	INSTALL_ROOT="$pkgdir" make install

	pushd "$pkgdir/usr/lib"
	for intflink in 'libqt4intf.so' 'libqt4intf.so.5' 'libqt4intf.so.5.2' 'libqt4intf.so.5.2.1' 'libqt4intf.so.5.2.5'; do
		ln -s libQt4Pas.so.5.2.5 $intflink
	done
	popd
}
