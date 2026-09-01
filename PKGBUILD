pkgname=filebyte
pkgver=2.3.5
pkgrel=1
pkgdesc="A CLI tool for analyzing files and directories with detailed metadata, permissions, and size information"
url="https://github.com/execRooted/filebyte"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$url/archive/v$pkgver.tar.gz"
        "install.sh"
        "uninstall.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "target/release/fbt" "$pkgdir/usr/bin/fbt"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "install.sh" "$pkgdir/usr/share/$pkgname/install.sh"
    install -Dm755 "uninstall.sh" "$pkgdir/usr/share/$pkgname/uninstall.sh"
}
