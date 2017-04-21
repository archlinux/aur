# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=zsync-curl-git 
pkgver=r66.0a98026
pkgrel=1
pkgdesc="zsync build against libcurl to support https"
arch=('x86_64')
url="https://github.com/probonopd/zsync-curl"
license=('Artistic2.0')
depends=('curl')
makedepends=('git')
source=('git+https://github.com/probonopd/zsync-curl.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#	cd "$srcdir/${pkgname}"
#	patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
#}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}/src"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
	make DESTDIR="$pkgdir/" install
}
