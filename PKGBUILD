# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.14.3
pkgrel=1
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('4e2f8edeaf233d0498afe42c3dbbeb4c52d1841aa73332bc4dd33621f51e28fa449922b990d66931364f610dc2e4948fa7aa98ecde53325f5428c50dc84f3d96')

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
