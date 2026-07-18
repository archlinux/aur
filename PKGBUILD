# Maintainer: grafmorkov <grafmorkov@gmail.com>

pkgname=vent-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="A fast, simple dependency installer for repositories"
arch=('x86_64')
url="https://github.com/grafmorkov/vent"
license=('GPL3')

depends=(
    'curl'
    'libarchive'
)

makedepends=(
    'cmake'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/grafmorkov/vent/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=(
    'SKIP'
)

build() {
    cmake -B build \
        -S "vent-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    install -Dm755 \
        build/vent \
        "$pkgdir/usr/bin/vent"

    install -Dm644 \
        "vent-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
