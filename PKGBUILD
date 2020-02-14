# Maintainer: Tim Diels <timdiels.m@gmail.com>

pkgname=electroneum
pkgver=3.1.0.1
pkgrel=1
pkgdesc='Secure, private, mobile based cryptocurrency '
arch=('any')
url='https://electroneum.com'
license=('custom')
makedepends=('cmake')
depends=('boost' 'openssl' 'unbound')
optdepends=(
    'miniupnpc: NAT punching'
    'libunwind: stack traces'
    'ldns: SSL toolkit'
    'expat: XML parsing'
    'doxygen: documentation'
    'graphviz: documentation'
)
source=("https://github.com/$pkgname/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('14d14a003c23552e30edbe66b3a3c116f35695bd03044f517abaa46ea627f17c882d83fbdf3e0dd9407ba8b8325d3105200270403a6ee4bafda56627bf28e8ba')

build() {
    cd "$pkgname-$real_pkgver"
    # Note: plain make fails with undeclared DIFFICULTY_TARGET_V1
    # make release-static fails when compiling with e.g. -j8
    make -j1 release-static
}

package() {
    cd "$pkgname-$real_pkgver"
    # Note: make has no install target. Static build means we don't need to
    # install lib.
    install -dm755 "$pkgdir/usr/bin/"
    install -Dm755 build/release/bin/* "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

