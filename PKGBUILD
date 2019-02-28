# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: Antonio Cardace <antonio@cardace.it>

_pkgname="s2argv-execs"

pkgname="$_pkgname-git"
pkgver=r37.aa3c3d6
pkgrel=1
pkgdesc="s2argv converts a command string into an argv array for execv*, execs is like execv taking a string instead of an argv"
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
	autoreconf -if
	./configure --prefix="/usr"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
