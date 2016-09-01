# Maintainer: Robin Thompson <robin*dot*thompson99*at*gmail*dot*com>
_pkgname=mate-dock-applet
pkgname=mate-applet-dock-git
pkgver=0.74.r0.g6646d47
pkgrel=4
epoch=
pkgdesc="An application dock applet for the MATE panel"
arch=('any')
url="https://github.com/robint99/mate-dock-applet"
license=('GPLv3')
depends=("mate-panel" "python" "python-xdg" "python-cairo" "python-gobject" "python-pillow")
makedepends=("git")
install="mate-applet-dock.install"
source=("git+http://github.com/robint99/mate-dock-applet")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/mate-dock-applet"
        aclocal
        automake --add-missing
        autoreconf
	./configure --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/mate-dock-applet"
	make DESTDIR="$pkgdir/" install
}
