# Maintainer: Robin Thompson <robin*dot*thompson99*at*gmail*dot*com>
_pkgname=mate-dock-applet
pkgname=mate-applet-dock-git
pkgver=0.81.r0.g1953fa8
pkgrel=1
epoch=
pkgdesc="An application dock applet for the MATE panel"
arch=('any')
url="https://github.com/robint99/mate-dock-applet"
license=('GPLv3')
depends=("mate-panel" "python" "python-xdg" "python-cairo" "python-gobject" "python-pillow" "libkeybinder3" "python-dbus" "bamf")
conflicts=("mate-applet-dock")
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
	./configure --prefix=/usr --with-gtk3 --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/mate-dock-applet"
	make DESTDIR="$pkgdir/" install
}
