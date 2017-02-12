# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=unixcw-git
_pkgname=unixcw
pkgver=3.5.0.r17.g0306399
#.r17.g0306399
pkgrel=1
pkgdesc="CW tutor & generator - program suite - Ham Radio - GIT version"
arch=('i686' 'x86_64')
url="http://unixcw.sourceforge.net"
license=('GPL')
depends=('qt5-base')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'gettext' 'pkg-config')
optdepends=('hamradio-menus')
provides=('unixcw')
conflicts=('unixcw')
source=("$_pkgname::git://git.code.sf.net/p/$_pkgname/code#branch=master"
        $_pkgname.1
	$_pkgname.desktop
	$_pkgname.png)

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_pkgname
			 
	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$_pkgname

	make prefix=$pkgdir/usr install
						   											 
	cd $pkgdir/usr/share/man/man1
	ln -sf xcwcp.1.gz unixcw.1.gz
															   
	cd $srcdir
	install -D -m755 $_pkgname.1 $pkgdir/usr/bin/$_pkgname
	install -D -m644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	install -D -m644 $_pkgname.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}                                                  
md5sums=('SKIP'
         '3f6168a6c81c550dc78006202f959db3'
         'b07f06b4fc940ba1b853e2b23f686490'
         'f7f81dcf7a1bba55bf8cde70d59d8ed5')
sha256sums=('SKIP'
            'f23fdc2c7346abd26b8acc8961eff599f08e6905a6cef2b0e402d86c6a9a1714'
            '69d3905c87200ddfda66275b72e73b8fda0636a0a600f5a6e7d8324caab0eee7'
            'be1d10724873ae84fec6f580792e5ce9fe2dbfc3e75e2bde14f6893391a63ff1')
