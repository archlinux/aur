# Maintainer: George Rawlinson <grawlinson@archlinux.org>
pkgname=lapce
pkgver=0.0.2
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
makedepends=('rust' 'python' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('32fe0562a4127e92534b9f4248a089e1872b835e80e2837ddee26f2271cb70246a03a09000eb279af937b781e4b9ecb8fb6707cb6db1b41e6bed4491faf1ebfb')
b2sums=('44d0686041692957449e406bc077e94f1b82d24b714dc636c1eca6eab4cea8141e16a97edab976cf014f3611c63d7b1f39c9068f5c0fc5fb9938a1070dbe5018')

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
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
