# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vdeplug_vlan"

pkgname="$_pkgname-git"
pkgver=r3.37f5795
pkgrel=3
pkgdesc="802.1q (vlan) support nested plugin for vdeplug4"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('LGPL')
depends=('vdeplug4-git')
makedepends=('git')
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
