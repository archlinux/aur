# Maintainer: Fedor Suchkov <f.suchkov@gmail.com>

pkgname=etherate-git
_pkgreponame=Etherate
pkgver=r118.e6ca3a7
pkgrel=1
pkgdesc="Linux CLI Ethernet and MPLS Testing Tool"
arch=('x86_64')
url="https://github.com/jwbensley/Etherate"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/jwbensley/Etherate.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgreponame}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgreponame}"
	./configure.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${_pkgreponame}"
	make -k check
}

package() {
	cd "$srcdir/${_pkgreponame}"
	make DESTDIR="$pkgdir/" install
}
