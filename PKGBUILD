# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vuos"

pkgname="$_pkgname-git"
pkgver=r209.46fd79c
pkgrel=1
pkgdesc="view based o.s."
arch=('any')
url="https://github.com/virtualsquare/$_pkgname"
license=('GPL2')
groups=('view-os')
depends=('purelibc' 's2argv-execs' 'libstropt' 'strcase' 'libvolatilestream' 'vdeplug4')
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
