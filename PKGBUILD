# Maintainer: gbletr42 <gbletr42@gmail.com>
_pkgname="wirehair"
pkgname="wirehair-git"
pkgver=r1.557c00c
pkgrel=3
pkgdesc="O(N) Fountain Code for Large Data"
arch=('i686' 'x86_64')
url="https://github.com/catid/wirehair"
license=('BSD-3-Clause')
options=(staticlibs)
makedepends=('git' 'cmake')
source=('git+https://github.com/catid/wirehair.git'
	'static.patch')
sha256sums=('SKIP'
            '0518aaea558d351ca5be53ab534577f5503ddb44326b961af21b90c7e7207c4d')
provides=(wirehair)
conflicts=(wirehair)

prepare() {
	patch --forward --strip=1 --input=../static.patch
}

build() {
	cd $_pkgname
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -S . -B build
	make -C build
}

package() {
	cd $_pkgname
	make -C build install DESTDIR="$pkgdir"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

