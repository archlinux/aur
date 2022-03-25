# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce
pkgver=0.0.12
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://lapce.dev"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/archive/v$pkgver.tar.gz")
sha512sums=('a66342fee4914acbfd83e941c2e20303ae224eb5f510aa4e1111b73f89390d79bd4df9c80049f0148da47c0f780b90faea95f3d115fbd02df7b8c23b49095486')
b2sums=('6b67b8a283780093f484cac698d3186c470f3a9a121417fc96df840982490dd6fde15e62c80ea313b8641b7b398ac01d3cdb56357bb07cad74cd18f93b718433')

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
