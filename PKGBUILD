# Maintainer: Evert Vorster < gmail-com: evorster >

pkgname=bigsh0t-plugins-git
_srcname=bigsh0t
pkgver=2.5.r12.g8e852fb
pkgrel=1
pkgdesc='360 equirectangular VR Video Stitching and Manipulation filters for free video editors'
arch=('i686' 'x86_64')
url=https://bitbucket.org/leo_sutic/bigsh0t/src/main/
license=('GPL')
depends=('git')
makedepends=('git' 'opencv')
optdepends=('opencv')
provides=('bigsh0t-plugins')
conflicts=('bigsh0t-plugins')
source=('git+https://bitbucket.org/leo_sutic/bigsh0t.git')
sha256sums=('SKIP')

prepare() {
	cd "$_srcname"
	mkdir -p Release-Linux
}

pkgver() {
	cd "$_srcname"
	printf '%s' "$(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "$_srcname"
	cd Release-Linux
	cmake -S .. -B . -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	mkdir -p "$pkgdir"/usr/lib/frei0r-1
        mkdir -p "$pkgdir"/share/shotcut/qml/filters/
	cd "$builddir"
        cd "$_srcname"
        cp -rp Release-Linux/bigsh0t-2.6-linux/lib/frei0r-1/* $pkgdir/usr/lib/frei0r-1/
        cp -rp Release-Linux/bigsh0t-2.6-linux/shotcut/share/shotcut/qml/filters/* $pkgdir/share/shotcut/qml/filters/
#        cp -rp Release-Linux/bigsh0t-$(echo $pkgver | cut -s -d"." -f1,2)-linux/lib/frei0r-1/* $pkgdir/usr/lib/frei0r-1/
#	cp -rp Release-Linux/bigsh0t-$(echo $pkgver | cut -s -d"." -f1,2)-linux/shotcut/share/shotcut/qml/filters/* $pkgdir/share/shotcut/qml/filters/
}
