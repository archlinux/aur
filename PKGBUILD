# Maintainer: Yuki Joou <yukijoou@kemonomimi.gay>
pkgname=axmldec
pkgver=1.2.1
pkgrel=2
pkgdesc="Stand-alone binary AndroidManifest.xml decoder"
arch=(x86_64)
url="https://github.com/SelfRef/axmldec"
license=('ISC')
depends=('boost' 'zlib' 'minizip-ng')
makedepends=('cmake' 'doxygen')
source=("git+${url}")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir"/"$pkgname"
	git submodule update --init --recursive
	git checkout "v${pkgver}"
	mkdir build/
	cd build/
	cmake -DCMAKE_BUILD_TYPE=Release ..
}

build() {
	cd "$srcdir"/"$pkgname"/build
	make
}

package() {
	cd "$srcdir"/"$pkgname"/build
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/axmldec"
}
