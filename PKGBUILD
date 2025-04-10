# Maintainer: Hugo Haldi <hugo dot haldi at gmail dot com>

pkgname=swift-format
pkgver=601.0.0
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('swift-bin')
makedepends=('git')
source=(
  swift-format-${pkgver}.tar.gz::https://github.com/apple/swift-format/archive/${pkgver}.tar.gz
)
sha256sums=('ab5e3323fc1bfd55d158ae074774d7f5eecd3b2d93f7eb731397b53b5f06b4ec')

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
