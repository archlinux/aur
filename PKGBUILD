# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: Antonio Cardace <antonio@cardace.it>

_pkgname="s2argv-execs"

pkgname="$_pkgname-git"
pkgver=r34.c51c856
pkgrel=1
pkgdesc="s2argv converts a command string into an argv array for execv*, execs is like execv taking a string instead of an argv"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
groups=('view-os')
#~ depends=('')
provides=("$_pkgname")
replaces=("lib$_pkgname")
source=("git+https://github.com/rd235/$_pkgname.git")
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
