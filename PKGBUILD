# Maintainer: canfro <francodvo@gmail.com>
pkgname=erwin-lang-git
pkgver=r29.6f6ed69
pkgrel=1
pkgdesc="The Erwin programming language compiler and standard library"
arch=('x86_64')
url="https://github.com/erwin-lang"
license=('Apache-2.0')
depends=('gcc')
makedepends=('git' 'rust' 'cargo')
provides=('erwin')
conflicts=('erwin')

source=(
    "core::git+https://github.com/erwin-lang/erwin-core.git"
    "std::git+https://github.com/erwin-lang/erwin-std.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/core"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/core"
    cargo build --release --locked
}

package() {
    install -Dm755 "${srcdir}/core/target/release/erwin" "${pkgdir}/usr/bin/erwin"
    mkdir -p "${pkgdir}/usr/lib/erwin"
    cp -r "${srcdir}/std/std" "${pkgdir}/usr/lib/erwin/"
    install -Dm644 "${srcdir}/core/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
