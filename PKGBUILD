# Contributor: Melik Ludwig Manukyan <melik@archlinux.us>

pkgname=archey2
pkgver=20121013
pkgrel=2
pkgdesc="Simple python script that displays the arch logo and some basic information. Python 2.x version"

arch=('i686' 'x86_64')
url="http://github.com/djmelik/archey"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=('archey')
conflicts=('archey3' 'archey')
source=('python27.patch')

_gitroot="git://github.com/djmelik/archey.git"
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
	patch -p1 -i ${srcdir}/python27.patch

	install -D -m755 archey ${pkgdir}/usr/bin/archey || return 1
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/archey/COPYING
}
md5sums=('d5a4b8f4b71379b869a12879199b0b38')
