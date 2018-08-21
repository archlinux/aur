# Maintainer: liums <liums at openaliasbox.org>
pkgname=opendbviewer-git
pkgver=v1.0.2.r83.gb158d2c
pkgrel=1
pkgdesc="A simple database explorer for SQLITE, MySQL, PostgreSQL."
arch=('x86_64' 'i686')
url="https://github.com/Jet1oeil/opendbviewer"
license=('GPL3')
depends=('qt5-base' 'imagemagick')
makedepends=('cmake' 'git' 'qt5-tools')
provides=('opendbviewer')
conflicts=('opendbviewer')
source=("git://github.com/Jet1oeil/opendbviewer.git")
_gitname='opendbviewer'
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitname"
	sed -i -e 's/share\/\${APPLICATION_PACKAGE_NAME}\/doc/share\/doc\/\${APPLICATION_PACKAGE_NAME}/' CMakeLists.txt
}

build() {
	mkdir -p "$_gitname/build"
	cd "$_gitname/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package() {
	cd "$_gitname"
	make -C "build/" DESTDIR="$pkgdir/" install
	install -Dm644 data/logos/opendbviewer.png "$pkgdir/usr/share/pixmaps/opendbviewer.png"
}
