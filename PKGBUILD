# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on work made by Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu-git
_gitname=brisk
pkgver=v0.4.5.r22.gf001f39
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment - git version'
arch=('i686' 'x86_64')
url='https://github.com/solus-project/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel')
makedepends=('gnome-common')
optdepends=('mozo: for menu edition'
		'menulibre: for menu edition') 
options=('!libtool' '!emptydirs')
provides=('brisk-menu')
conflicts=('brisk-menu')
source=(git+https://github.com/solus-project/brisk-menu.git)
sha1sums=('SKIP')

pkgver() {
	cd $srcdir/brisk-menu
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/brisk-menu

	autoreconf -i
    intltoolize
  
	./configure \
		--prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib/${pkgname}

	make
}


package() {
	cd $srcdir/brisk-menu

	make DESTDIR="${pkgdir}" install
}

