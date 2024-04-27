# Maintainer: Hugo Haldi <hugo dot haldi at gmail dot com>

pkgname=swift-format
pkgver=510.1.0
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('any')
license=('APACHE')
depends=('swift-language')
makedepends=('git')
source=("swift-format-${pkgver}.tar.gz::https://github.com/apple/swift-format/archive/${pkgver}.tar.gz")
sha256sums=('2174db6f721e66ddc95263239e4dd6112f81833bbf9cd4051cf9d3dca0f7b7fe')
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
