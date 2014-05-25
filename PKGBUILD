# Contributor: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=libirecovery
pkgname=$_pkgname-git
pkgver=20110213
pkgrel=1
pkgdesc="Console library for iBoot/iBSS used by iPhone & iPod touch"
arch=('i686' 'x86_64')
url="http://github.com/Chronic-Dev/$_pkgname"
license=('custom')
groups=()
depends=('usbmuxd' 'libimobiledevice')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/Chronic-Dev/$_pkgname.git"
_gitname="$_pkgname"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	make all

	mkdir -p $pkgdir/usr/lib
	cp libirecovery.a $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/include
	cp include/libirecovery.h $pkgdir/usr/include
	mkdir -p $pkgdir/usr/bin
	cp irecovery ${pkgdir}/usr/bin
}
