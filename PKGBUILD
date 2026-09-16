# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=ratex-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultra-fast, pure-Rust TeX engine and typesetting toolchain (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/leoliu0/ratex"
license=('MIT' 'Apache-2.0')
provides=('ratex' 'texmk' 'pdflatex' 'xelatex' 'lualatex' 'bibtex')
conflicts=('ratex')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/releases/download/v${pkgver}/tex-suite-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    cd "$srcdir/tex-suite-linux-x86_64"
    ./install.sh --prefix "$pkgdir/usr" --no-path --skip-verify --no-alias-latexmk
    rm -f "$pkgdir/usr/share/tex-suite/.tex-suite-managed-files-v1"
    if [ -f LICENSE-MIT ]; then
        install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    fi
    if [ -f LICENSE-APACHE ]; then
        install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    fi
}
