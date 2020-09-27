# Maintainer: Hugo Haldi <hugo dot haldi at google dot com>

pkgname=swift-format
pkgver=0.50300.0
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('any')
license=('APACHE')
depends=('swift-language')
source=("swift-format-${pkgver}.tar.gz::https://github.com/apple/swift-format/archive/${pkgver}.tar.gz")
sha256sums=('1bd9916234e2f7c525694d1a48865b8e6f753c4bae26c4acd8ee55885c87ae29')

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