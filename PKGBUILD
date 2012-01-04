# Contributor: Mark Grimes <mark_aur@peculier.com>

pkgname=stopmotion
pkgver=0.6.2
pkgrel=1
arch=('i686')
pkgdesc="Stop motion animation creation program"
url="http://stopmotion.bjoernen.com"
license=('GPL')
# conflicts=()
# replaces=()
makedepends=('pkgconfig')
depends=('qt' 'libtar' 'sdl_image' 'libxml2' 'libvorbis' 'fam' 'inotify-tools')
source=(http://developer.skolelinux.no/info/studentgrupper/2005-hig-stopmotion/project_management/webpage/releases/$pkgname-$pkgver.tar.gz)
md5sums=('a139f036286f31bba21effb2b6553d1e')

_qt4profile=/etc/profile.d/qt4.sh

build() {
	[ -e $_qt4profile ] && . $_qt4profile
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --with-html-dir=/usr/share/$pkgname/html
	make || return 1
	make prefix=$startdir/pkg install

	# Makefile doesn't seem to install the man file
	gzip ${pkgname}.1
	mkdir -p $startdir/pkg/usr/share/man/man1  || return 1
	install -m 644 -p ${pkgname}.1.gz $startdir/pkg/usr/share/man/man1
}

