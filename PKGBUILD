# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=license
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to easily add a license to your project"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/license/"
license=('MPL-2.0')
source=("https://git.sr.ht/~zethra/license/archive/$pkgver.tar.gz")
depends=('gcc-libs-multilib')
makedepends=('rust' 'cargo')
sha256sums=("429a1d688aaf150513babba2996a1ea9c8bebcd0e31deae3902b740a55952b1b")

build() {
    tar -xf $pkgver.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
