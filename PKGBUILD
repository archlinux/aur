# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=biome-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="A toolchain for web projects, aimed to provide functionalities to maintain them. Biome offers formatter and linter, usable via CLI and LSP."
arch=("x86_64" "aarch64")
url="https://github.com/biomejs/biome"
license=("MIT" "Apache-2.0")
provides=("biome")
conflicts=("biome")
changelog=$pkgname.changelog
source=(
    LICENSE-APACHE::"https://github.com/biomejs/biome/blob/cli/v$pkgver/LICENSE-APACHE?raw=true"
    LICENSE-MIT::"https://github.com/biomejs/biome/blob/cli/v$pkgver/LICENSE-MIT?raw=true"
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
sha256sums_x86_64=('58a584a6248c9a63f80904668c5d4fffa34a914869507a3b4fb5a5ca433dbce9')
sha256sums_aarch64=('560c9e33f936c9794a37d99092c5bae501ca9e3f32f109f6aec2fba78279884b')

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
