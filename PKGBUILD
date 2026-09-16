# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=ratex-bin
pkgver=0.1.0
pkgrel=3
pkgdesc="Ultra-fast, pure-Rust TeX engine and typesetting toolchain (pre-compiled binary with full CJK/math fonts)"
arch=('x86_64')
url="https://github.com/leoliu0/ratex"
license=('MIT' 'Apache-2.0')
provides=('texmk')
conflicts=('ratex')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/releases/download/v${pkgver}/tex-suite-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('9f64ad6aaad8330f70f755601548d96988f3acc6754153130100b552a526892e')

package() {
    cd "$srcdir/tex-suite-linux-x86_64"
    install -Dm755 bin/texmk "$pkgdir/usr/bin/texmk"
    if [ -d share/tex-suite/texmf ]; then
        install -d "$pkgdir/usr/share/tex-suite"
        cp -a share/tex-suite/* "$pkgdir/usr/share/tex-suite/"
    fi
    if [ -f LICENSE-MIT ]; then
        install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    fi
    if [ -f LICENSE-APACHE ]; then
        install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    fi
}
