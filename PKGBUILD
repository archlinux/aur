# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: Antonio Cardace <antonio@cardace.it>

_pkgname="s2argv-execs"

pkgname="$_pkgname-git"
pkgver=r38.2f3f79c
pkgrel=1
pkgdesc="s2argv converts a command string into an argv array for execv*, execs is like execv taking a string instead of an argv"
arch=('any')
url="https://github.com/virtualsquare/$_pkgname"
license=('LGPL')
groups=('virtualsquare')
depends=('glibc')
makedepends=('git' 'cmake')
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
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$_pkgname"/build
	make DESTDIR="$pkgdir/" install
}
