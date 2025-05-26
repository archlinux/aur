# Maintainer: Hugo Haldi <hugo dot haldi at gmail dot com>

pkgname=swift-format
pkgver=6.1.1
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('swift-bin')
makedepends=('git')
source=(
  swift-format-${pkgver}.tar.gz::https://github.com/apple/swift-format/archive/swift-${pkgver}-RELEASE.tar.gz
)
sha256sums=('5bbd2236ea9fa840f28299b743f2eb40355b32e7dafc22cc7e05ac132cae16eb')

prepare() {
    rm -rf swift-format
    mv swift-format-swift-${pkgver}-RELEASE swift-format
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
