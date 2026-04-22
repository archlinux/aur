# Maintainer: canfro <francodvo@gmail.com>
pkgname=erwin-core-git
pkgver=r33.d61d9fd
pkgrel=1
arch=('x86_64')
url="https://github.com/erwin-lang/erwin-core.git"
license=('Apache-2.0')
makedepends=('git' 'rust' 'cargo')
pkgdesc="The Erwin programming language compiler"
depends=('gcc' 'erwin-std-git')
provides=('erwin')
conflicts=('erwin')
source=('git+https://github.com/erwin-lang/erwin-core.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/erwin-core"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/erwin-core"
    cargo build --release --locked
}

package() {
    cd "$srcdir/erwin-core"
    install -Dm755 "target/release/erwin" "${pkgdir}/usr/bin/erwin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
