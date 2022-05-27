# Maintainer: Daniel Duan <daniel@duan.ca>
pkgname=ea-command
pkgver=0.2.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="ea: make your CLI output actionable"
url="https://github.com/dduan/ea"
license=('MIT')
source=("https://github.com/dduan/ea/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('df461668c4603ec01614e5c680ff8e511451d4055f4f4572edcd2fe2fa3aca1e')

build() {
    cd "$srcdir/ea-$pkgver"
    cargo build --release --locked --target-dir=$PWD/target
}

check() {
    cd "$srcdir/ea-$pkgver"
    cargo test --release --locked --target-dir=$PWD/target
}

package() {
    cd "$srcdir/ea-$pkgver"
    install -Dm 755 target/release/ea "${pkgdir}/usr/bin/ea"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    install -Dm 644 docs/ea.1 "${pkgdir}/usr/share/man/man1/ea.1"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
