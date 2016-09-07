# Maintainer:  Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: swanson <webaake gmail com>

pkgname=mousepad-git
_pkgname=mousepad
pkgver=0.4.0.r114.gedbe8b6
pkgrel=1
pkgdesc="Mousepad development version, gtk3 only version"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'gtksourceview3' 'exo' )
makedepends=('xfce4-dev-tools' 'git' 'pkgconfig' 'gettext')
provides=('mousepad')
conflicts=('mousepad' 'mousepad-gtk3')
source=(git://git.xfce.org/apps/mousepad/)
md5sums=('SKIP')

pkgver() {
	cd $srcdir/${_pkgname}
	git describe --long | sed 's/^mousepad-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/${_pkgname}

	./autogen.sh \
	--prefix=/usr \
    --sysconfdir=/etc \
	--libexecdir=/usr/lib/xfce4 \
	--disable-static \
	--disable-debug 
	
	make  
}

package() {

	cd $srcdir/${_pkgname}
	make DESTDIR="$pkgdir" install
}


