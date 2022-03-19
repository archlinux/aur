# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce
pkgver=0.0.11
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://lapce.dev"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/archive/v$pkgver.tar.gz")
sha512sums=('8d4bb1a499a0400e26843026b97e3785b8a5fe08c742f0eb4924442c35a669e4eeef1d1c13b13e682a04ee54c51b653f98b118d783b6be84f86fe32b540384b6')
b2sums=('dfe65e2fb65cd0adba9c3508c33a42e7c94c9ad7d9f7667c3b66dced6e071579a68a56bc49995b2b513af118fdc1a07dfe913bb5b4205ff082110fc115ab8cd8')

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
