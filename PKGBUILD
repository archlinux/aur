# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=libcvtapi-git
pkgver=r136.b30f7ad
pkgrel=1
pkgdesc='Official implementation of the VirusTotal API in C programming language'
arch=('x86_64')
url='https://github.com/VirusTotal/c-vtapi'
license=('Apache')
depends=('libcurl.so' 'jansson')
makedepends=('git')
provides=('libcvtapi.so')
conflicts=('libcvtapi')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$pkgname"
	autoreconf -fi
	./configure --disable-doxygen-doc --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
