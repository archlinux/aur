# Maintainer: Nathan Craddock <contact@nathancraddock.com>
pkgname=zf
pkgver=0.9.0
pkgrel=1
pkgdesc="a commandline fuzzy finder designed for filtering filepaths"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'zig')
provides=(zf)
url="https://github.com/natecraddock/zf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a40caf5b9ed2c45a703b10d214f513cfc004489330db8202d3834ba9c824ee92')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m755 zig-out/bin/zf "$pkgdir/usr/bin/zf"
    install -D -m644 doc/zf.1 "$pkgdir/usr/share/man/man1/zf.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -D -m644 complete/zf "$pkgdir/usr/share/bash-completion/completions/zf"
    install -D -m644 complete/_zf "$pkgdir/usr/share/zsh/site-functions/_zf"
    install -D -m644 complete/zf.fish "$pkgdir/usr/share/fish/completions/zf.fish"
}
