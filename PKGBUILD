# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="libvdestack"

pkgname="$_pkgname-git"
pkgver=r11.d9070d4
pkgrel=1
pkgdesc="Internet of Threads through Network Namespaces"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
depends=('s2argv-execs-git' 'vdeplug4-git')
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
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
