# Maintainer: Ateles
pkgname=spor-git
pkgver=0.3.2.r0.g6fa16b6
pkgrel=1
pkgdesc='infinite undo for your whole project'
arch=('x86_64' 'aarch64')
url='https://github.com/emprcl/spor'
depends=('gcc-libs')
makedepends=('git' 'go')
license=('MIT')
source=("$pkgname::git+${url}")
sha256sums=('SKIP')
provides=('spor')
conflicts=('spor')

pkgver() {
    cd "$srcdir/$pkgname" || exit 1
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    go build -o spor ./cmd/spor
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 'spor'      "$pkgdir/usr/bin/spor"
    install -Dm644 'LICENSE'   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
