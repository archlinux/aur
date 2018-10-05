# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vdeplug4"

pkgname="$_pkgname-git"
pkgver=r41.979eec0
pkgrel=1
pkgdesc="VDE: Virtual Distributed Ethernet. Plug your VM directly to the cloud"
arch=(any)
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
groups=("view-os")
depends=('s2argv-execs')
provides=("$_pkgname")
conflicts=('vde2')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	autoreconf -i
	./configure --prefix="/usr"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
