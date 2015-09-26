pkgname=wxmaxima-git
pkgver=r2828.b849a7a
pkgrel=1
pkgdesc="A document based interface for the computer algebra system Maxima."
arch=('i686' 'x86_64')
url="http://andrejv.github.io/wxmaxima/index.html"
license=('GPL2')
depends=('maxima' 'wxgtk' 'libxml2' 'desktop-file-utils' 'shared-mime-info')
makedepends=('git' 'texi2html')
conflicts=('wxmaxima')
provides=('wxmaxima')
source=("git+https://github.com/andrejv/wxmaxima.git")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
	cd "$srcdir/wxmaxima"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/wxmaxima"
	
	./bootstrap
	./configure --with-wx-config=/usr/bin/wx-config --prefix=/usr
	make
	make allmo
}

package() {
	cd "$srcdir/wxmaxima"
	
	make DESTDIR="$pkgdir" install
}
