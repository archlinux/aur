# Maintainer: Nachtalb <na@nachtalb.io>
pkgname=mcp-wsl
pkgver=0.1.0
pkgrel=1
pkgdesc="MCP server exposing Linux system info and command execution over stdio or HTTP"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Nachtalb/mcp-wsl"
license=('LGPL-3.0-only')
makedepends=('rust' 'cargo')
provides=('mcp-wsl')
conflicts=('mcp-wsl-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nachtalb/mcp-wsl/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('05f302b73bd336d9bfce20821f88f9adaec4c89ec46e224edd398021324fd73d0db3c967bc14963460540b88c0b617c8d86a1644292631229e7d30b806d30a11')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm4755 target/release/mcp-wsl "$pkgdir/usr/bin/mcp-wsl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
