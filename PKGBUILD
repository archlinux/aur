# Maintainer: Robin Thompson <robin*dot*thompson99*at*gmail*dot*com>
_pkgname=dock-applet
pkgname=mate-applet-dock-gtk3-git
pkgver=0.72
pkgrel=1
epoch=
pkgdesc="An application dock applet for the GTK3 MATE panel"
arch=('any')
url="https://github.com/robint99/dock-applet"
license=('GPLv3')
depends=("mate-panel-gtk3" "python" "python-xdg" "python-cairo" "python-gobject" "python-pillow" "python-scipy")
makedepends=("git")
install="mate-applet-dock-gtk3.install"
source=("git+http://github.com/robint99/dock-applet")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/dock-applet"
        aclocal
        automake --add-missing
        autoreconf
	./configure --prefix=/usr --with-gtk3 --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/dock-applet"
	make DESTDIR="$pkgdir/" install
}

