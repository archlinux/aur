# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-git
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-bin')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo')
source=("fmp-$pkgver.tar.gz::https://codeberg.org/lwilko/fmp/archive/v$pkgver.tar.gz")
sha512sums=('9272b6c07024362b648874b09577a7c36e6758d4e960545535ed0400693622b26d6459587d69e0c9705ed1e66d28e34245cf7f13f600d20e5f9725125c3f06cb')

build() {
  cd "fmp-$pkgver"

  cargo build --release
}

package() {
  cd "fmp-$pkgver"

  install -Dm755 "target/release/fmp" "$pkgdir/usr/bin/fmp"
 
  install -Dm644 "data/com.fmp.desktop" \
    "$pkgdir/usr/share/applications/com.fmp.desktop"

  install -Dm644 "data/com.fmp.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.fmp.svg"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
