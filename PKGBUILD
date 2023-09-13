# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.4.2
pkgrel=1
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('a895b9974ea8107a10bbdcd16b208bf3626e5419d14893ae78b2acf3cc02a3699045c88bed729522d86d915c34a87abeeef3b290d190532f6666d4a48a2c13c4')

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
