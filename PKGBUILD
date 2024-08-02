# Maintainer: Yuki Joou <yukijoou@kemonomimi.gay>
pkgname=axmldec
pkgver=1.2.0
pkgrel=1
pkgdesc="Stand-alone binary AndroidManifest.xml decoder"
arch=(x86_64)
url="https://github.com/ytsutano/axmldec"
license=('ISC')
depends=('boost' 'zlib' 'minizip-ng')
makedepends=('cmake' 'doxygen')
source=("git+${url}"
		"use-system-minizip.patch")
sha256sums=('SKIP'
            'ec6e298a912a19131af2da4ac0ccd45d0ce58a51e2470380e86eafb6a2803609')

prepare() {
	cd "$srcdir"/"$pkgname"
	git submodule update --init --recursive
	git checkout "v${pkgver}"
	git apply ../use-system-minizip.patch
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
