pkgname=s2geometry
pkgver=0.9.0
pkgrel=2
pkgdesc="A library for manipulating geometric shapes"
url="https://s2geometry.io/"
arch=("x86_64" "aarch64")
source=("https://github.com/google/s2geometry/archive/refs/tags/v0.9.0.tar.gz" "166.patch" "78.patch")
sha256sums=("54c09b653f68929e8929bffa60ea568e26f3b4a51e1b1734f5c3c037f1d89062" "SKIP" "SKIP")
depends=("openssl")
makedepends=("cmake")
license=("Apache-2.0")

prepare() {
	cd $pkgname-$pkgver

	patch -Np1 -i "$srcdir"/78.patch
	patch -Np1 -i "$srcdir"/166.patch
}

build() {
	cd $pkgname-$pkgver
	cmake -B build -DCMAKE_INSTALL_PREFIX='/usr'
	make -C build
}

package() {
	cd $pkgname-$pkgver
	make -C build DESTDIR="$pkgdir/" install
}
