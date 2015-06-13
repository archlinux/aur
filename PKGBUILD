# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias T. <OldShatterhand at gmx-topmail dot de>
# Maintainer: SanskritFritz (gmail)

pkgname=bibletime-git
_gitname="bibletime"
pkgver=v2.10_rc1.r162.g6748de7
pkgrel=1
epoch=2
pkgdesc="Bible study tool for KDE4."
arch=('x86_64' 'i686')
url="http://www.bibletime.info/"
license=('GPL2')
depends=('sword' 'openssl' 'clucene' 'qtwebkit')
makedepends=('cmake' 'git')
provides=('bibletime')
conflicts=('bibletime')
source=("git://github.com/bibletime/bibletime.git")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
	cd "$_gitname"
#	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'

}

build() {
	mkdir "$srcdir/$_gitname/build_dir"
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
