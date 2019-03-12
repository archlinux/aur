# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vuos"

pkgname="$_pkgname-git"
pkgver=r225.f4fdd44
pkgrel=3
pkgdesc="view based o.s."
arch=('any')
url="https://github.com/virtualsquare/$_pkgname"
license=('GPL2')
groups=('view-os')
depends=('purelibc-git' 's2argv-execs-git' 'libstropt-git' 'strcase-git' 'libvolatilestream-git' 'vdeplug4-git' 'userbindmount-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git" "http://www.cs.unibo.it/~renzo/canonicalize_patch")
md5sums=(
	'SKIP'
	'd92d7037a246b13fc95f8ba28ed0fe3c'
)

prepare() {
	cd "$_pkgname"
	patch umvu/src/canonicalize.c -N -i ../canonicalize_patch
}

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
