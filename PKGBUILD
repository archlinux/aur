# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-git
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-bin' 'fmp-bin-debug')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo' 'tar')
source=("fmp-$pkgver.tar.gz::https://codeberg.org/lwilko/fmp/archive/v$pkgver.tar.gz")
sha512sums=('1ac9edb1692f054c2147b17c73eb356913fa97e02b3a0c1f6dfa2412d55595237bea01e75b5b48ffb9c7d737c0c6e17fc7bdae903828bd19fec147e9078ca282')

build() {
  tar -zxvf "fmp-$pkgver.tar.gz"
  cd "fmp"

  cargo build --release
}

package() {
  cd "fmp"

  install -Dm755 "target/release/fmp" "$pkgdir/usr/bin/fmp"

  install -Dm644 "data/com.fmp.desktop" \
    "$pkgdir/usr/share/applications/com.fmp.desktop"

  install -Dm644 "data/com.fmp.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.fmp.svg"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
