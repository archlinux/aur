# Maintainer: Tim Diels <timdiels.m@gmail.com>

pkgname=electroneum
pkgver=0.11.0.0.revert
real_pkgver=0.11.0.0-revert
pkgrel=2
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
source=("https://github.com/$pkgname/$pkgname/archive/v$real_pkgver.tar.gz")
md5sums=('ecaa9b3aaa47db4b45c1d6ab4b3274b9')

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

