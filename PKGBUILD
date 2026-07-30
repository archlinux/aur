# Maintainer: lokifisch <lokifisch@lokifisch.dev>
pkgname=cheap
pkgver=1.0.0
pkgrel=1
pkgdesc="Cheapest Hierarchical Enchant-Anvil Planner -- native Minecraft enchantment ordering tool"
arch=('x86_64' 'aarch64')
url="https://github.com/Lokifisch/cheap"
license=('MIT')
depends=('gtk4')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lokifisch/cheap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92a63ce9dbd93657f2ec659d1d8478b1e7e1371f9e683f4ef8d26397207bdda2')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
