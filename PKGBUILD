# Maintainer: Hugo Haldi <hugo dot haldi at gmail dot com>

pkgname=swift-format
pkgver=6.2
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('swift-bin')
makedepends=('git')
source=(
  swift-format-${pkgver}.tar.gz::https://github.com/swiftlang/swift-format/archive/refs/tags/602.0.0.tar.gz
)
sha256sums=('d72b8ca81face822b7ef9c5d9db87e2479c9851345406e0ea237dcaa047f5e0a')

prepare() {
    rm -rf swift-format
    mv swift-format-602.0.0 swift-format
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
