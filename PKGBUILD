# Maintainer: gbletr42 <gbletr42@gmail.com>
_pkgname="leopard"
pkgname="leopard-git"
pkgver=r2.6e5725e
pkgrel=1
pkgdesc="O(N Log N) MDS Reed-Solomon Block Erasure Code for Large Data"
arch=('i686' 'x86_64')
url="https://github.com/catid/leopard"
license=('BSD-3-Clause')
makedepends=('git' 'cmake')
source=('git+https://github.com/catid/leopard.git'
	'install.patch')
options=(staticlibs)
sha256sums=('SKIP'
           '0192dae0b2a7d4c26b57ed1780f4c57d4d355c33141a118c675ea334175bc859')
provides=(leopard)
conflicts=(leopard)

prepare() {
	patch --forward --strip=1 --input=../install.patch
}

build() {
	cd $_pkgname
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DBUILD_SHARED_LIBS=1 -S . -B build
	make -C build
}

package() {
	cd $_pkgname
	make -C build install DESTDIR="$pkgdir"

	install -Dm644 License.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
