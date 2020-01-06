pkgname=gtkplatform
pkgver=0.2.4+7+g4e1790b
pkgrel=2
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
conflicts=('qt-gtk-platform-plugin')
depends=('gtk3' 'libnotify' 'qt5-base')
makedepends=('git')
_commit=4e1790b7324d1fd07593d39a0e986956f9d00749
source=(
	"git+$url.git#commit=$_commit"
	'qt514.patch'
)
sha512sums=('SKIP'
            'f3ab0f417fe474716e40ab29399954ecd92796e3482b73e9fbc9662b722d00f415f40daf0d2d4b67dce51cc1d73800e6c15daf23da86df58460ecd2eed1cb28d')

prepare() {
	cd $pkgname
	patch -Np1 -i ../qt514.patch
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
