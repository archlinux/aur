# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=wt-zig
pkgver=0.4.4
pkgrel=1
pkgdesc='Git worktree manager with organized directory structure'
arch=('x86_64')
url='https://github.com/douglas/wt-zig'
license=('MIT')
depends=('glibc' 'git')
makedepends=('zig')
provides=('wt')
conflicts=('wt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce3624be7b350b14011c838a7ad5b6f471539700e384a90bf4e77a43963bde01')

build() {
    cd "$pkgname-$pkgver"
    zig build \
        -Doptimize=ReleaseSafe \
        -Dversion="$pkgver" \
        --prefix build \
        --cache-dir "$srcdir/zig-cache" \
        --global-cache-dir "$srcdir/zig-global-cache"
}

check() {
    cd "$pkgname-$pkgver"
    zig build test \
        --cache-dir "$srcdir/zig-cache" \
        --global-cache-dir "$srcdir/zig-global-cache"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/bin/wt "$pkgdir/usr/bin/wt"
}
