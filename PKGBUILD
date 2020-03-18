pkgname=gtkplatform
pkgver=0.2.4+11+g1149f4f
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
conflicts=('qt-gtk-platform-plugin')
depends=('gtk3' 'libnotify' 'qt5-base')
makedepends=('git')
_commit=1149f4f77523f650e542f83e9a1985e0b9f00a05
source=(
	"git+$url.git#commit=$_commit"
)
sha512sums=('SKIP')

pkgver() {
	cd $pkgname

	git describe --tags --long | sed 's/^v//; s/-/+/g'
}

build() {
	cd $pkgname

	qmake DESTDIR=$srcdir
	make
}

package() {
	cd $pkgname

	make INSTALL_ROOT="$pkgdir" install
}
