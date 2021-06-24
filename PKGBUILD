# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=unity-test-git
pkgver=2.5.2.r20.g2f74065
pkgrel=1
pkgdesc="Simple unit testing for C"
arch=('x86_64')
url="https://github.com/throwtheswitch/unity"
license=('MIT')
makedepends=('git' 'cmake>=3.12')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$pkgname" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -Dm 644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

