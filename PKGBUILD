# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vuos"

pkgname="$_pkgname-git"
pkgver=r227.ce83c05
pkgrel=2
pkgdesc="view based o.s."
arch=('any')
url="https://github.com/virtualsquare/$_pkgname"
license=('GPL2')
groups=('view-os')
depends=('purelibc-git' 's2argv-execs-git' 'libstropt-git' 'strcase-git' 'libvolatilestream-git' 'vdeplug4-git' 'userbindmount-git' 'fuse-ext2-git')
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
	ln -s -f /usr/lib/umview/modules/umfuseext2.so "$pkgdir/"usr/lib/vu/modules/vufuseext2.so
}
