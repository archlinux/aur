# Maintainer: Hector Mtz-Seara <hseara at gmail dot com>

pkgname=dssp
pkgver=4.6.1
pkgrel=1
pkgdesc="Secondary structure assignment for proteins"
arch=('x86_64')
url="https://github.com/PDB-REDO/dssp"
license=('BSD-2-Clause')
depends=('gcc-libs' 'glibc' 'pcre2' 'zlib')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PDB-REDO/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ddb8274f03ac0338adffcd661989f515fffb95d40afca404cf2677024256ae3')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


