# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

pkgname=swift-format
pkgver=6.3
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('swift-bin')
makedepends=('git')
source=(
  swift-format-${pkgver}.tar.gz::https://github.com/swiftlang/swift-format/archive/refs/tags/603.0.0.tar.gz
)
sha256sums=('39732a76ba0d86dca799b8c92f3516398aaa712e1ec489c9e439219e72feac1f')

prepare() {
    rm -rf swift-format
    mv swift-format-603.0.0 swift-format
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
