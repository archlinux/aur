# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="libstropt"

pkgname="$_pkgname-git"
pkgver=r18.40f7b58
pkgrel=1
pkgdesc="Parse options from a string (supports quotation, option arguments, no malloc needed for parsing)"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('LGPL')
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
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
