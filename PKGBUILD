# Maintainer: Ateles
pkgname=tui-chart-git
pkgver=0.2.0.r0.ged21c70
pkgrel=1
pkgdesc='High resolution live charts for the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/c0m4r/tui-chart'
depends=('gcc-libs')
makedepends=('git' 'go')
license=('AGPL-3.0-only')
source=("$pkgname::git+${url}")
sha256sums=('SKIP')
provides=('tui-chart')
conflicts=('tui-chart')

pkgver() {
    cd "$srcdir/$pkgname" || exit 1
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    go build ./cmd/tui-chart
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 'tui-chart' "$pkgdir/usr/bin/tui-chart"
    install -Dm644 'LICENSE'   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
