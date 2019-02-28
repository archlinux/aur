# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="purelibc"

pkgname="$_pkgname-git"
pkgver=r5.d455939
pkgrel=1
pkgdesc="A glibc overlay library for process self-virtualization"
arch=('any')
url="https://github.com/virtualsquare/$_pkgname"
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
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
