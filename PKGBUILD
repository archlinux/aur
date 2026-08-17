# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=1.26.0
pkgrel=1
pkgdesc="Cache-first DeepSeek coding agent for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
makedepends=('go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73b927ed540ac72dd0dc7b52e02bbd58dd5a7f91bf8ce2b0993776d6e7dfd083')

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
