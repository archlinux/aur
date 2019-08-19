pkgname=gtkplatform
pkgver=0.2.4+5+gda0e695
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
conflicts=('qt-gtk-platform-plugin')
depends=('gtk3' 'libnotify' 'qt5-base')
makedepends=('git')
_commit=da0e6959ae4dcc4db1bf44058883bea2207bf73b
source=(
	"git+$url.git#commit=$_commit"
)
md5sums=('SKIP')
sha512sums=('SKIP')

prepare() {
	cd $pkgname

	#Fix build on Qt 5.13 https://github.com/CrimsonAS/gtkplatform/pull/48
	git merge --squash 9434258d4fda66729eaab25105583ebe5aca8134
}

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
