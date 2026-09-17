# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=ratex-bin
pkgver=0.1.0
pkgrel=5
pkgdesc="Ultra-fast, pure-Rust TeX engine and complete self-contained typesetting suite"
arch=('x86_64')
url="https://github.com/leoliu0/ratex"
license=('MIT' 'Apache-2.0')
provides=('ratex')
conflicts=('ratex')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/releases/download/v${pkgver}/tex-suite-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('1b525cf130edf65d37806969c8a170d771e5f75def949fd5789c1846c5017631')

package() {
    cd "$srcdir/tex-suite-linux-x86_64"
    install -Dm755 bin/ratex "$pkgdir/usr/bin/ratex"
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
