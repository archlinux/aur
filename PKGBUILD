# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-git
pkgver=1.4.5
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-bin')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo')
source=("fmp-$pkgver.tar.gz::https://codeberg.org/lwilko/fmp/archive/v$pkgver.tar.gz")
sha512sums=('68da661493230afc1d41c58becbf9b00c78669bd622a6904b4a3c9704b84fb920fb241aa0801cbb12e08376c44ebd25419fd4aa0da5c464930b34e86af8e6953')

build() {
  cd "fmp-$pkgver"

  cargo build --release
}

package() {
  cd "fmp-$pkgver"

  install -Dm755 "target/release/fmp" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
