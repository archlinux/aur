# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.4.1
pkgrel=1
depends=('fontconfig' 'freetype2' 'xclip')
makedepends=('rust' 'cargo' 'glibc' 'llvm-libs' 'gcc-libs' 'clang' 'python')
arch=('x86_64')
pkgdesc="Create beautiful image of your code"
license=('MIT')
url="https://github.com/Aloxaf/silicon"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aloxaf/silicon/archive/v$pkgver.tar.gz")
sha256sums=('43c736dce804f91f05f4fff85aaf6f036827278a5d03f35d7c63581a42e6bff3')

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
