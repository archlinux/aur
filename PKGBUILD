# Maintainer: odpay <https://github.com/odpay>
pkgname=odzip
pkgver=1.0.2
pkgrel=1
pkgdesc='Minimal file compression using LZ77 hash-chain matching and Huffman coding'
arch=('x86_64')
url='https://github.com/odpay/odzip'
license=('MIT')
depends=('glibc')
provides=('odz')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/odpay/odzip/archive/v$pkgver.tar.gz")
sha256sums=('acce695d331c1ce1358cbf081b0702e3b5b87c2055a5608c52b1def42f7a18aa')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DODZ_PORTABLE=ON
    cmake --build build
}

check() {
    cmake --build build --target run
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
