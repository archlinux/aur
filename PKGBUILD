# Maintainer: Fethbita <aur AT fethbita DOT com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: <philipp.classen@posteo.de>

pkgname=verifpal
pkgver=0.51.0
pkgrel=1
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3' 'custom:cc-by-nc-nd-4.0')
makedepends=('rust' 'cargo')
source=("https://github.com/symbolicsoft/verifpal/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname-$pkgver-manual.pdf::https://static.verifpal.com/manual.pdf"
        "$pkgname-$pkgver-manual-license.txt::https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt")
sha256sums=('a95e62c4471fef42796ec620f7dc37b2e508e4bbdf65f822b53a3c5e65d55104'
            '1322974d31c0e23774e592215a659f3c28108195b9c6fd2d06a58f7bfa26e446'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  install -Dm644 "$pkgname-$pkgver-manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"
  install -Dm644 "$pkgname-$pkgver-manual-license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/manual-LICENSE"
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
