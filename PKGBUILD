# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

pkgname=swift-format
pkgver=6.4
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('swift-bin')
makedepends=('git')
source=(
  swift-format-${pkgver}.tar.gz::https://github.com/swiftlang/swift-format/archive/refs/tags/604.0.0.tar.gz
)
sha256sums=('43f7f4d039dd85733fdb6119dcd29271d08936592ee9904840f0fd743b061894')

prepare() {
    rm -rf swift-format
    mv swift-format-604.0.0 swift-format
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
