# Maintainer: Yaron de Leeuw <jdlmail@gmail.com>

pkgname=zimlib-git
pkgver=0.0.0
pkgrel=1
pkgdesc="The standard implementation of the ZIM specification - openzim"
arch=('i686' 'x86_64')
url="http://openzim.org/wiki/Zimlib"
license=('GPL2')
makedepends=('git')
depends=('xz' 'gcc-libs')
source=("$pkgname"::git+https://gerrit.wikimedia.org/r/p/openzim.git)
md5sums=('SKIP')

# find version according to 
# http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"/zimlib
	./autogen.sh
	./configure --prefix=/usr
	make
}


package() {
	cd "$srcdir/$pkgname/zimlib"
	make DESTDIR="$pkgdir/" install
}
