# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias T. <OldShatterhand at gmx-topmail dot de>
# Maintainer: SanskritFritz (gmail)

pkgname=bibletime-git
_gitname="bibletime"
pkgver=v2.11_beta1.r7.g1be749c
pkgrel=1
epoch=2
pkgdesc="Bible study tool."
arch=('x86_64' 'i686')
url="http://www.bibletime.info/"
license=('GPL2')
depends=('sword' 'qt5-webengine')
makedepends=('cmake' 'git')
provides=('bibletime')
conflicts=('bibletime')
source=("git://github.com/bibletime/bibletime.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'

}

build() {
	mkdir -p "$srcdir/$_gitname/build_dir"
	cd "$srcdir/$_gitname/build_dir"

	CXXFLAGS+=" -fpermissive"
	cmake	-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DQT_QMAKE_EXECUTABLE=qmake-qt4 \
		-DBT_FORCE_USE_QT4=TRUE \
		..

	make
}

package() {
	cd "$srcdir/$_gitname/build_dir"
	make DESTDIR="$pkgdir" install
}
