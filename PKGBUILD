# Maintainer:  Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Thomas Frans <franske2000 at gmail dot com>

pkgname=wiki-tui
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple and easy to use Wikipedia Text User Interface"
arch=('x86_64')
url="https://github.com/Builditluc/wiki-tui"
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2cc40e3e4ff7713044b3220a2ae256596e6abca143e365d154f6b2258d706002fc85d8191b172fb892660e1aea3e337c08c3f2dff91cc73e3f6efd420f7dc5cf')

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
