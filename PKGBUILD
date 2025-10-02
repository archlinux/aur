# Maintainer: Hugo Haldi <hugo dot haldi at gmail dot com>

pkgname=swift-format
pkgver=6.1.3
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
sha256sums=('73223e04412147f0f71d9f92c257478348cddae0b4ac89034a37f478192903bc')

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
