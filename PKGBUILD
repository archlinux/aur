# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce
pkgver=0.0.6
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a8210eb2d01fab703eea173497e09abf075114463d3da8fd30585c58880142b2dd75fb2df4c8fbf8b8409bae74fb783e9b8ffec21c961c9dac877fb6052401f8')
b2sums=('0791773c1eb80be4a49b4c1b35b9bed8151e3d05d02b6ce956976b415b8f179cd145d7ee0e1ecf0ae4c957fd345a70e1d4efa2c69ea74faea7c81d64802246ff')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
