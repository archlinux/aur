# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=subrandr-git
pkgver=1.1.0.r5.gc53ea5b
pkgrel=1
pkgdesc="A subtitle rendering library for SRV3 (YouTube) and WebVTT (development build)"
arch=('x86_64')
url="https://github.com/afishhh/subrandr"
license=('MPL-2.0')
depends=()
makedepends=('cargo' 'git')
provides=('subrandr')
conflicts=('subrandr')
source=("git+https://github.com/afishhh/subrandr.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/subrandr"
    git describe --long --tags --always | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
    cd "$srcdir/subrandr"
    cargo build --release
    strip target/release/libsubrandr.so
}

package() {
    cd "$srcdir/subrandr"
    install -Dm755 "target/release/libsubrandr.so" \
        "$pkgdir/usr/lib/libsubrandr.so"
}
