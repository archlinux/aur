# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce
pkgver=0.0.9
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('dc5753c54fa52616483dc9dd9a37addbc5a38dcb40a78ffd7384adea80b25fde90caae3bb31c4c906b05b2a6b3439770d6689fd3f8754bed4344a6caa2aa2bd1')
b2sums=('67733b4d6fa611318733d7c48dba1847946bd0d4fc935dfeb9fb2744986abf4252e53c37a93bfedb45931dcacf09cdbcdd340dabe6530b228c1fcff3df8e0f00')

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
