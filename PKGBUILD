# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=biome-bin
pkgver=1.9.3
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
sha256sums_x86_64=('848ea1768bcae3cf3e4924c9335810013bebf7b2157430ab6c33fae4e5b3bfd5')
sha256sums_aarch64=('4365bb2a368e851580ccaac9b2673dfb7d4af65a155da7fbe1052b0cd6208f45')

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
