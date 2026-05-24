# Maintainer: adrianpriza-ai <coreygit1@gmail.com>

pkgname=alps-pm
pkgver=0.9.6
pkgrel=1
pkgdesc="Advanced Linux Package System — customizable package manager frontend with AUR support"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/adrianpriza-ai/alps"
license=('MIT')
depends=('pacman')
makedepends=('go' 'git')
optdepends=(
    'git: required for AUR makepkg fallback'
    'base-devel: required for AUR makepkg fallback'
    'yay: preferred AUR helper'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "alps-$pkgver"
    export CGO_ENABLED=0
    go build -ldflags="-s -w -X main.version=v$pkgver" -o alps .
}

check() {
    cd "alps-$pkgver"
    go vet ./...
}

package() {
    cd "alps-$pkgver"

    # binary
    install -Dm755 alps "$pkgdir/usr/bin/alps"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # readme
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
