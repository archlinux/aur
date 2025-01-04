pkgname=lrzip-next
pkgver=0.13.2
pkgrel=1
pkgdesc="Next generation multi-threaded compression with rzip"
arch=('x86_64')
url="https://github.com/pete4abw/lrzip-next"
license=('GPL-2.0-or-later')
depends=(bzip2 bzip3 libgcrypt lz4 lzo zlib zstd)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1d30d058662397d65a021b7ecef18334ece35412a3285a6f173267c888845fab44076d8a00446b88ec33c8e45fb9c23d6c94cb0b7da3f3b21a2d83bbc6d476e9')

prepare() {
	cd "$pkgname-$pkgver"

	env NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
