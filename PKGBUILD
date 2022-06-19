# Maintainer: Daniel Duan <daniel@duan.ca>
pkgname=tre-command
pkgver=0.4.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tree command, improved."
url="https://github.com/dduan/tre"
license=('MIT')
source=("https://github.com/dduan/tre/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('280243cfa837661f0c3fff41e4a63c6768631073c9f6ce9982d9ed08e038788a')

build() {
    cd "$srcdir/tre-$pkgver"
    cargo build --release --locked --target-dir=$PWD/target
}

check() {
    cd "$srcdir/tre-$pkgver"
    cargo test --release --locked --target-dir=$PWD/target
}

package() {
    cd "$srcdir/tre-$pkgver"
    install -Dm 755 target/release/tre "${pkgdir}/usr/bin/tre"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    install -Dm 644 manual/tre.1 "${pkgdir}/usr/share/man/man1/tre.1"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "scripts/completion/_tre" "$pkgdir/usr/share/zsh/site-functions/_tre"
    install -Dm644 "scripts/completion/tre.bash" "$pkgdir/usr/share/bash-completion/completions/tre"
    install -Dm644 "scripts/completion/tre.fish" "$pkgdir/usr/share/fish/completions/tre.fish"
}
