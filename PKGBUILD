# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>
pkgname=trojita-git
_pkgname=trojita
pkgver=20100712
pkgrel=1
pkgdesc="A QT IMAP email client"
arch=(i686 x86_64)
url="http://trojita.flaska.net"
license=('GPL')
depends=('qt')
makedepends=('git' 'cmake')

_gitroot="git://gitorious.org/${_pkgname}/${_pkgname}.git"
_gitname=$_pkgname

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	qmake
	make

	install -D -m755 src/Gui/trojita "$pkgdir/usr/bin/trojita"
}
