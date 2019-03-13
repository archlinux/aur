# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="userbindmount"

pkgname="$_pkgname-git"
pkgver=r6.149048f
pkgrel=2
pkgdesc="A library and a utility command providing support for bind mount in user namespaces."
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
groups=('view-os')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MANDIR=/usr/share/man
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
