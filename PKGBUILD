# Maintainer: odpay <https://github.com/odpay>
pkgname=odzip
pkgver=1.0.1
pkgrel=1
pkgdesc='Minimal file compression using LZ77 hash-chain matching and Huffman coding'
arch=('x86_64')
url='https://github.com/odpay/odzip'
license=('MIT')
depends=('glibc')
provides=('odz')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/odpay/odzip/archive/v$pkgver.tar.gz")
sha256sums=('5dee83ba6471003a9843b69c8df4bb0631a508a5bbbd238825cb89e05138f230')

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
