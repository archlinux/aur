#Contributor: Anselmo L. S. Melo <anselmolsm @ gmail.com>

pkgname=iceberg-git
pkgver=r91.b30bf8c
pkgrel=1
pkgdesc=""
url="https://github.com/hugopl/Iceberg"
license=('GPL')
depends=('qt5-base' 'icecream')
arch=('i686' 'x86_64')
source=('iceberg::git+https://github.com/hugopl/Iceberg.git')
md5sums=('SKIP')
makedepends=('git' 'cmake>=2.8.10.2' 'icecream' 'qt5-base')
provides=('iceberg')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir build
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
    	export PKG_CONFIG_PATH=/usr/lib/icecream/lib/pkgconfig/:$PKG_CONFIG_PATH
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/iceberg ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	mkdir -p $pkgdir/usr/bin
	make install
	ln -s /opt/iceberg/bin/iceberg $pkgdir/usr/bin/iceberg
}
