# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=llm-visuals-git
pkgver=0.14.0.r32.gde6b1a0
pkgrel=1
pkgdesc='Live truecolor terminal dashboard for a locally running LLM'
arch=('x86_64' 'aarch64')
url='https://github.com/DingoOz/llm-visuals/'
license=('MIT')
depends=('gcc-libs')
optdepends=(
)
makedepends=('cargo' 'git')
provides=('llm-visuals')
conflicts=('llm-visuals')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
    cd "$pkgname" || exit 1
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 'target/release/llm-visuals' "$pkgdir/usr/bin/llm-visuals"
    install -Dm644 'LICENSE'               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'README.md'             "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 'ERRORS.md'             "$pkgdir/usr/share/doc/$pkgname/ERRORS.md"
    cp -r          'docs'                  "$pkgdir/usr/share/doc/$pkgname/"
}
