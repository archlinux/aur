# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.3.1
pkgrel=1
depends=('fontconfig' 'freetype2' 'xclip')
makedepends=('rust' 'cargo' 'glibc' 'llvm-libs' 'gcc-libs' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Create beautiful image of your code"
license=('MIT')
url="https://github.com/Aloxaf/silicon"
source=(
    "https://github.com/Aloxaf/silicon/archive/v$pkgver.tar.gz"
)
sha256sums=(
    '01a6d76b603428b4a9a83dd38f02436f99de9266cefd3f02203a19a524835d1f'
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
