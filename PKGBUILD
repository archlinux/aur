# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor"
arch=('x86_64')
url="https://lapce.dev"
license=('Apache')
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon' 'fontconfig')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/archive/v$pkgver.tar.gz")
sha512sums=('7c5b708941f7b01527a7e309b93fab6d0e7582f921c97c01ed57a787e200ed9d4f40e6176a9af9ccf1a6de05bca99db5f7ee658630960324e86ec2c3d08876bc')
b2sums=('8b81a053e16d3f99eb067a4ff019c05471f4fac21d7043be2347895fa55ff77590abc613211a04a6607537ac773df3595b7944e6acde07ae9aed143a8a27e46d')

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
