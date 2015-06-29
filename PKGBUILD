# Maintainer: Viech

pkgname=osavul-git
pkgver=0.20130506
pkgrel=1
pkgdesc="A standalone server browser for Unvanquished."
arch=('x86_64' 'i686')
url="http://www.unvanquished.net"
license=('GPL3')
depends=('qt4>=4.7')
makedepends=('git' 'make')

_gitroot="https://github.com/Unvanquished/Osavul.git"
_gitname="osavul"

build() {
	cd $srcdir

	msg "Connecting to GIT server..."

	if [[ -d $_gitname ]]; then
		msg "Updating local files..."
		cd $_gitname
		git pull
	else
		msg "Cloning repository..."
		git clone $_gitroot $_gitname
	fi

	msg "The local files are up to date."
	msg "Starting build..."

	cd $srcdir/$_gitname

	qmake-qt4 && make
}

package() {
	# create directories
	install -d $pkgdir/usr/bin $pkgdir/usr/share/applications

	# install binary
	install $srcdir/$_gitname/$_gitname $pkgdir/usr/bin/

	# install desktop file (currently uses the icon of unvanquished)
	install -m 644 $srcdir/$_gitname/debian/$_gitname.desktop $pkgdir/usr/share/applications/
}
