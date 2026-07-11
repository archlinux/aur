# Maintainer: Monjaris <ziyanovruzlu.750@gmail.com>
pkgname=brainflop
pkgver=1.1.4
pkgrel=2
pkgdesc="Optimized Brainfuck compiler and runner that can also transpile to C with customizable code-generation options"
options=('!debug')
arch=('x86_64')
url="https://github.com/Monjaris/brainflop"
license=('MIT')
depends=('gcc')
makedepends=('xmake' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41394cd0d21f14e4f5b3ef0937468d90a4abb3831e42259e7c4bc52cbf33cc25')

build() {
    cd "$pkgname-$pkgver"
    xmake config -m release
    xmake build -j$(nproc) bfc
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/linux/x86_64/release/bfc "$pkgdir/usr/bin/brainflop"
    ln -s brainflop "$pkgdir/usr/bin/bfc"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
