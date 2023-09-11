# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.4
pkgrel=1
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('1ea26e25ad960206861a426f964aae0d18bffd454a5c4fbc6e81d0f160242d2893f42335f333dd1abe15f452f6d6c0e37f348d3236651efc390409a0aabf4096')

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
