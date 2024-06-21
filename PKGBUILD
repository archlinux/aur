# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=biome-bin
pkgver=1.8.2
pkgrel=1
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
            '4f6a0d776a00c0f46e1da1879321896071494229aa3219862a625e4560691a3a')
sha256sums_x86_64=('0971bc636e1abc6d06ea03b219f6c78488b209f8a623de081a04ce610ae47f10')
sha256sums_aarch64=('4467475395c09442c23efca6bc800f8db14f21791ffc77594f71c11ec9c85aa3')

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