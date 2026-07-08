# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=1.17.8
pkgrel=1
pkgdesc="Cache-first DeepSeek coding agent for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
makedepends=('go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('857ff3794206590f5421827c7d067aacb8f61a6abb62ff43156d00719f888d31')

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
