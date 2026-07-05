# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=1.16.2
pkgrel=1
pkgdesc="Cache-first DeepSeek coding agent for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
makedepends=('go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c0cef30c063b013ea62c560461517cfceb636f2eda5987df02f105cf0c7ecf5')

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
