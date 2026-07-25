# Maintainer: asyync1024 <asyync1024 at proton dot me>

pkgname=ndstrim-rs
pkgver=0.2.1
pkgrel=1
pkgdesc="A cross-platform NDS(i) ROM trimmer written in Rust"
arch=('x86_64')
url="https://github.com/Nemris/ndstrim-rs"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
provides=('ndstrim')
conflicts=('ndstrim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('336e417dc63a1d8b3c1db65692b3c644b73273be5977c947869527ee1059bc7ff51d2e08483b78af0d6998812a090a2463d7e653f55258d67add915488cc0378')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release # --locked is omitted since the build fails with it.
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/ndstrim" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
