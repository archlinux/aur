# Maintainer: Jérémie Roquet <jroquet@arkanosis.net>
pkgname=bamrescue
pkgver=0.2.0
pkgrel=1
pkgdesc="Utility to check Binary Sequence Alignment / Map (BAM) files for corruption and repair them"
arch=("x86_64")
url="https://bamrescue.arkanosis.net/"
license=("custom:ISC")
makedepends=("cargo")
checkdepends=("cargo")
source=("git+https://github.com/arkanosis/${pkgname}?signed#tag=v0.2.0")
md5sums=('SKIP')
validpgpkeys=("FA490B15D054C7E83F70B0408C145ABAC11FA702")

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

check() {
    cd "$srcdir/$pkgname"
    cargo test
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 "target/man/$pkgname.gz" "$pkgdir/usr/share/man/$pkgname.gz"
    #install -Dm644 "completion/bash/$pkgname" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    #install -Dm644 "completion/bash/$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
