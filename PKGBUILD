# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typst-lsp
pkgver=0.9.2
pkgrel=1
pkgdesc="Language server for Typst"
arch=('i686' 'x86_64')
url="https://github.com/nvarner/typst-lsp"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/nvarner/typst-lsp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10d999b8a0084108fd80bd1a049287e212914d34751b53ff5a98c128e8c97539')


prepare() {
  cd "typst-lsp-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "typst-lsp-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "typst-lsp-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE-MIT.txt" -t "$pkgdir/usr/share/licenses/typst-lsp"
}
