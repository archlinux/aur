# Maintainer: purpleleaf  <max@ganoia.eu>
_pkgname=jgmenu
pkgname=$_pkgname-git
pkgver=`git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  | sed 's:^v::'`
pkgrel=1
pkgdesc="Simple, independent, contemporary-looking X11 menu, designed for scripting, ricing and tweaking. Compiled with gtktheme, lx and pmenu support"
arch=('x86_64')
url="https://github.com/johanmalm/$_pkgname"
license=('GPL2')
depends=('libx11' 'cairo' 'pango' 'libxrandr' 'librsvg' 'libxml2' 'glib2' 'menu-cache' 'python')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd ${pkgname}
 echo $pkgver
}


build() {
	cd "$pkgname-$pkgver"
	./configure --with-gtktheme --with-lx --with-pmenu --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

