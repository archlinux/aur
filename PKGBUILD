# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.3.2
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
    "510e8d6a5cf856f5060088ea6d5d22a510b6adeea2ea5b71d4d186e417115061"
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
