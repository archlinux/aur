# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="libvolatilestream"

pkgname="$_pkgname-git"
pkgver=r3.6b564fc
pkgrel=1
pkgdesc="volatile stream = stdio FILE* stream as a temporary dynamically allocated (and deallocated) memory buffer"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
provides=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
