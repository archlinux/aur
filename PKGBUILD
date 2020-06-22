# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <griffithsdj@archlinux.us>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Marc poiroud <marci1 AT archlinux.fr>
_projectname='recordmydesktop'
pkgname="qt-$_projectname"
_commit='r602'
pkgver="0.3.8.$_commit"
pkgrel='2'
pkgdesc='Qt4 frontend for recordMyDesktop'
arch=('any')
url="http://$_projectname.sourceforge.net"
license=('GPL3' 'LGPL3')
depends=('python' 'python-pyqt4' 'qt4' 'recordmydesktop>=0.3.8.1' 'xorg-xwininfo')
source=(
	"$pkgname-$pkgver-$pkgrel.zip::https://sourceforge.net/code-snapshots/svn/${_projectname:0:1}/${_projectname:0:2}/$_projectname/svn/$_projectname-svn-$_commit-trunk.zip"
	'python3-port.diff'
)
sha256sums=('19e1b5cd5f381f73050f041b6533b6ce61e0d83269c633eb200737307e54a142'
            '9597526e04e6c90072b194ff95b87fd3109888c013b04063b14743a140fa7bab')

_sourcedirectory="$_projectname-svn-$_commit-trunk/$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# mix of 2to3 output and the port done by the Mageia folks - http://sophie.zarb.org/rpms/a9bbcbd5892495675eb0bb36409f15e9/files/3
	patch --forward -p2 < "$srcdir/python3-port.diff"

	chmod +x 'autogen.sh'
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	./autogen.sh
	./configure --prefix '/usr'
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make DESTDIR="$pkgdir" install
}
