# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.4.2
pkgrel=1
depends=('fontconfig' 'freetype2' 'xclip')
makedepends=('rust' 'cargo' 'glibc' 'llvm-libs' 'gcc-libs' 'clang' 'python')
arch=('x86_64')
pkgdesc="Create beautiful image of your code"
license=('MIT')
url="https://github.com/Aloxaf/silicon"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aloxaf/silicon/archive/v$pkgver.tar.gz")
sha256sums=('a5fb780ea33ca8e3db038a57efdfc8d4548a832e3eb027671057e6657b5d5294')

build() {
    cd "$srcdir/silicon-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/silicon-$pkgver"
    cargo check --release --locked
}

package() {
    cd "$srcdir/silicon-$pkgver"
    install -Dm755 "target/release/silicon" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
