# Maintainer:  Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Thomas Frans <franske2000 at gmail dot com>

pkgname=wiki-tui
pkgver=0.9.2
pkgrel=1
pkgdesc="A simple and easy to use Wikipedia Text User Interface"
arch=('x86_64')
url="https://github.com/Builditluc/wiki-tui"
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1cf07dc6ca815eec1ce58bd6d0fd28ede6f147303f2e5a11c6d6258ae1883ee099bfd2beec4a0e0e5a0cceac7d63f2d492ebdb26d0356790a4abfb0a78861ddb')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
