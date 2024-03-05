# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.4.7
pkgrel=1
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('3cf14ff0d5905019e83b5163d656253da9b5224f41ae98541b3d255d21ce6ad3f830353dedb6d514a07f77a4ce93cfae605a16709f03b265e8ca061873d5d47b')

build() {
    cd $pkgname-$pkgver
    cmake -B build \
		  -DCMAKE_BUILD_TYPE=Release \
	  	-DCMAKE_INSTALL_PREFIX=/usr \
		  -DVERSION_TAG=$pkgver \
		  -DPYTHON2=OFF \
		  -DPYTHON3=OFF \
		  -Wno-dev
    cmake --build build
}

package() {
    cd $pkgname-$pkgver
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
