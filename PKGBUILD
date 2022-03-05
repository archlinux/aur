# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce
pkgver=0.0.10
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://lapce.dev"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/archive/v$pkgver.tar.gz")
sha512sums=('4e8b609ecee7d9e6124aa66b6dc09211fcd09a2c93faf2d76e6fb289f0929c5a8d182e5db46563a75e4c7bd7b0a56680448eb0da91911112b5dc7fb1cbed4b64')
b2sums=('fb99f0feab9c0c229777a9b0cbe451f297a02e620a087771c7fc1fafe9ab1c0e69543c89f40a9451bc4065b94050747aa3e27882b3e2a3bea0fe471c2d1f23e1')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --frozen --release
}

package() {
    find "$pkgname-$pkgver/target/release" \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
