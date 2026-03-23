# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=wt-go
pkgver=0.2.0
pkgrel=1
pkgdesc='Git worktree manager with organized directory structure (Go implementation)'
arch=('x86_64')
url='https://github.com/douglas/wt'
license=('MIT')
depends=('glibc' 'git')
makedepends=('go>=1.26')
provides=('wt')
conflicts=('wt' 'wt-zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c38d3a6e0d5857bce51560a9b107e4a48b75348b71f5f8a4e80c8ce33a4f6e3e')

build() {
    cd "wt-$pkgver"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-s -w -X main.version=$pkgver" \
        -o wt .
}

package() {
    cd "wt-$pkgver"
    install -Dm755 wt "$pkgdir/usr/bin/wt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
