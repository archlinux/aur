# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=1.17.11
pkgrel=1
pkgdesc="Cache-first DeepSeek coding agent for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
makedepends=('go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fe4cf63d4431e727bd21fcd0aeb9afcc8dc5c10861e7b2aee1d5430610c6cea')

build() {
    cd "DeepSeek-Reasonix-$pkgver"
    export CGO_ENABLED=0
    go build -trimpath -ldflags "-s -w -X main.version=v$pkgver" \
        -o "$_pkgname" ./cmd/reasonix
}

package() {
    cd "DeepSeek-Reasonix-$pkgver"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
