# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=archey2
pkgver=2019.10.7
pkgrel=2
pkgdesc="Simple python script that displays the arch logo and some basic information. Python 2.x version"

arch=('i686' 'x86_64')
url="https://github.com/XdaemonX/archey"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=('archey')
conflicts=('archey3' 'archey')

_gitroot="https://github.com/XdaemonX/archey.git"
_gitname="archey"

package() {
	cd ${srcdir}
	rm -rf archey	
	msg "Connecting to GIT server...."

	if [ -d archey ] ; then
		cd archey && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/archey

	install -D -m755 archey ${pkgdir}/usr/bin/archey || return 1
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/archey/COPYING
}
md5sums=('cadd2230de52758f401ecb7852c417cc')
