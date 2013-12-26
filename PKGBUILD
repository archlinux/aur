# Maintainer: Wouter Haffmans <wouter@simply-life.net>
pkgname=grantlee-git
pkgver=v0.4.0.0.g358e826
pkgrel=1
pkgdesc="Grantlee is a string template engine based on the Django template system."
arch=('i686' 'x86_64')
url="http://www.grantlee.org"
license=('LGPL2.1')
depends=('qt4')
makedepends=('git' 'cmake')
conflicts=('grantlee')
provides=('grantlee')
source=("$pkgname"::'git://gitorious.org/grantlee/grantlee.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# Use the tag of the last commit
	local ver="$(git describe --tags --long)"
	printf "%s" "${ver//-/.}"
}

build() {
	mkdir "$pkgname/build"
	cd "$pkgname/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ".."
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
