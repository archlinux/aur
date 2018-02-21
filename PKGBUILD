# Maintainer: Tim Diels <timdiels.m@gmail.com>

pkgname=electroneum
pkgver=0.11.1.0
pkgrel=1
pkgdesc='Secure, private, mobile based cryptocurrency '
arch=('any')
url='https://electroneum.com'
license=('custom')
makedepends=('cmake')
depends=('boost' 'openssl' 'unbound')
#checkdepends=('gtest')
optdepends=(
    'miniupnpc: NAT punching'
    'libunwind: stack traces'
    'ldns: SSL toolkit'
    'expat: XML parsing'
    'doxygen: documentation'
    'graphviz: documentation'
)
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('368005dbbd07fa8b0a90f8b9efda4ff2')

build() {
    cd "$pkgname-$pkgver"
    # Note: plain make fails with undeclared DIFFICULTY_TARGET_V1
    # make release-static fails when compiling with e.g. -j8
    make -j1 release-static
}

# Tests always fail due to DIFFICULT_TARGET_V1 error, so we don't run them
#check() {
#    cd "$pkgname-$pkgver"
#    #make release-test
#}

package() {
    cd "$pkgname-$pkgver"
    # Note: make has no install target. Static build means we don't need to
    # install lib.
    install -dm755 "$pkgdir/usr/bin/"
    install -Dm755 build/release/bin/* "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

