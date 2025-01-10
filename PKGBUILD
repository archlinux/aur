# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.9
pkgrel=1
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('1960b4f05d7df8affa0310cf083caba37e4b3e24190326fd21aa55dd8ef3e2320597136bd024c994e5764e8c5c745952785e8af845834175e4019e806e9e07d0')

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
