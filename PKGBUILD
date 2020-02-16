# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="userbindmount"

pkgname="$_pkgname-git"
pkgver=r17.fea54ed
pkgrel=2
pkgdesc="A library and a utility command providing support for bind mount in user namespaces."
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2' 'LGPL')
depends=('libcap')
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
	mkdir -p "$_pkgname/build"
	cd "$_pkgname/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}
