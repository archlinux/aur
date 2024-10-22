# Maintainer: John Luebs

pkgname=vapor-toolbox
_binname=vapor
pkgver=18.7.5
_pkgname=toolbox
pkgrel=1
pkgdesc="A command line tool for the Vapor web framework"
arch=('x86_64')
url="https://github.com/vapor/toolbox"
license=('MIT')
depends=('swift-language')
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/vapor/toolbox/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0322fee24872b713e1e495070e6b7b1fca468bed19f48bcf7a1397ffdf701e9a')

prepare() {
  cd "${_pkgname}-$pkgver"
  # The pinned version of swift-log causes a crash (https://github.com/vapor/toolbox/issues/430)
  swift package update swift-log
}

build() {
  cd "${_pkgname}-$pkgver"
  swift build -c release
}

package() {
  cd "${_pkgname}-$pkgver"

  install -Dm755 .build/release/vapor "$pkgdir/usr/bin/vapor"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
