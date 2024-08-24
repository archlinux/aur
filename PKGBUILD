# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=biome-bin
pkgver=1.8.3
pkgrel=2
pkgdesc="A toolchain for web projects, aimed to provide functionalities to maintain them. Biome offers formatter and linter, usable via CLI and LSP."
arch=("x86_64" "aarch64")
url="https://github.com/biomejs/biome"
license=("MIT" "Apache-2.0")
provides=("biome")
conflicts=("biome")
changelog=$pkgname.changelog
source=(
    LICENSE-APACHE::https://raw.githubusercontent.com/biomejs/biome/main/LICENSE-APACHE
    LICENSE-MIT::https://raw.githubusercontent.com/biomejs/biome/main/LICENSE-MIT
)
source_x86_64=(
    $pkgname-x86_64-$pkgver::https://github.com/biomejs/biome/releases/download/cli/v$pkgver/biome-linux-x64-musl
)
source_aarch64=(
    $pkgname-aarch64-$pkgver::https://github.com/biomejs/biome/releases/download/cli/v$pkgver/biome-linux-arm64-musl
)
# checksum generate with 'makepkg -g'
sha256sums=('e2746aba8799f7a3378259f36a83a079e811ca7926cbdd248a2eb7ca9cbbac5d'
    '35365b6285e1f8cac61549f321befdbbe6139bf1e3d7ef6ccf1f1294ab015202')
sha256sums_x86_64=('f3db16d376d77cdc28f8031d2e2db95f3620c6f1e463e555bb5f3c441b6b96e5')
sha256sums_aarch64=('4f9f2a63255b335a80a197b80a0b2d5d00086c29205dfe7b9b6138c010777987')

build() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cp "$srcdir/$pkgname-$CARCH-$pkgver" "$srcdir/$pkgname-$pkgver/biome"
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    install -Dm755 biome "$pkgdir/usr/bin/biome"
    cd "$srcdir/"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
