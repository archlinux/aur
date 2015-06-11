#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='qmenu-git'
_gitname='qmenu'
_gitroot="git://github.com/teopost/qmenu.git"
pkgver=1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/teopost/qmenu"
depends=('ncurses')
#optdepends=('')
makedepends=('git')
license=('PUBLIC')
pkgdesc="Tool for creating simple menus in linux environments."
provides=('qmenu')
conflicts=('qmenu')
source=("git://github.com/teopost/qmenu.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}
	# rm -rf qmenu	
	msg "Connecting to GIT server...."

	if [ -d "$_gitname" ] ; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi
	msg "GIT checkout done or server timeout"

	# compile executable
	sh ./go

}

package() {
 # install executable and license
	install -D -m755 "$srcdir/$_gitname/qmenu" "$pkgdir/usr/bin/qmenu"
#	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}

