# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=biome-bin
pkgver=1.9.4
pkgrel=1
pkgdesc="A toolchain for web projects, aimed to provide functionalities to maintain them. Biome offers formatter and linter, usable via CLI and LSP."
arch=("x86_64" "aarch64")
url="https://github.com/biomejs/biome"
license=("MIT" "Apache-2.0")
provides=("biome")
conflicts=("biome")
changelog=$pkgname.changelog
source=(
    "LICENSE-APACHE-$pkgver::https://github.com/biomejs/biome/blob/cli/v$pkgver/LICENSE-APACHE?raw=true"
    "LICENSE-MIT-$pkgver::https://github.com/biomejs/biome/blob/cli/v$pkgver/LICENSE-MIT?raw=true"
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
sha256sums_x86_64=('02ca13dcbb5d78839e743b315b03c8c8832fa8178bb81c5e29ae5ad45ce96b82')
sha256sums_aarch64=('d34937f7b5a6f816af289e972bfd49827921ed43f44547f78180f3e4f539cc41')

build() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cp "$srcdir/$pkgname-$CARCH-$pkgver" "$srcdir/$pkgname-$pkgver/biome"
    mv "$srcdir/LICENSE-APACHE-$pkgver" "$srcdir/$pkgname-$pkgver/LICENSE-APACHE"
    mv "$srcdir/LICENSE-MIT-$pkgver" "$srcdir/$pkgname-$pkgver/LICENSE-MIT"
}

package() {
    cd "$srcdir/$pkgname-$pkgver/" || exit
    install -Dm755 biome "$pkgdir/usr/bin/biome"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
