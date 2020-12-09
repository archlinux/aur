# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=fre
pkgver=0.3.1
pkgrel=1
pkgdesc="CLI tool for tracking your most-used directories and files"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/camdencheek/fre"
license=('MIT')
source=("https://github.com/camdencheek/fre/archive/${pkgver}.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'cargo')
sha256sums=("22d8dddd1c634031e731ab3966d07aa01acc184b773ae1d9aa5fe5aa6c0c3858")

build() {
    tar -xf ${pkgver}.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
