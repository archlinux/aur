# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.4.0
pkgrel=2
depends=('fontconfig' 'freetype2' 'xclip')
makedepends=('rust' 'cargo' 'glibc' 'llvm-libs' 'gcc-libs' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Create beautiful image of your code"
license=('MIT')
url="https://github.com/Aloxaf/silicon"
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Aloxaf/silicon/archive/v$pkgver.tar.gz"
)
sha256sums=(
    "423c03d9c92cbad8f5a136abaa680e85dfa5b5f31998aab4424c335d4d99b7ab"
)

build() {
    cd "$srcdir/silicon-$pkgver"
    cargo build --release --locked
}

package() {
    cargo install --root="$pkgdir/usr" --path "$srcdir/silicon-$pkgver"
    install -Dm644 "$srcdir/silicon-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -f "$pkgdir/usr/.crates.toml"
}
