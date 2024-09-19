# Maintainer: Hugo Haldi <hugo dot haldi at gmail dot com>

pkgname=swift-format
pkgver=600.0.0
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('any')
license=('APACHE')
depends=('swift-language')
makedepends=('git')
source=("swift-format-${pkgver}.tar.gz::https://github.com/apple/swift-format/archive/${pkgver}.tar.gz")
sha256sums=('5d03930216701939bd34f82575a475bcb8d1962e095066449eedc5e22226d8b6')
prepare() {
    rm -rf swift-format
    mv swift-format-${pkgver} swift-format
}

build() {
    cd "$srcdir/swift-format"
    swift build -c release
}

check() {
    cd "$srcdir/swift-format"
    swift test --parallel
}

package() {
    cd "$srcdir/swift-format"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 .build/release/swift-format "$pkgdir/usr/bin"
}
