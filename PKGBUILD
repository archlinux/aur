# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_pkgname=MeiliSearch
pkgname=meilisearch
pkgver=0.10.0
pkgrel=1
pkgdesc="Lightning Fast, Ultra Relevant, and Typo-Tolerant Search Engine"
arch=(x86_64)
url="https://docs.meilisearch.com/"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/meilisearch/MeiliSearch/archive/v${pkgver}.tar.gz)
sha512sums=('f07622a25b1a7ba97b6a8139b5fa3b61e16ddf4176f9adb870339a4c33fbd1dfb6b41230b8cf220c50f65ca3add7679c160765ce1fd020abb5a45665b5af2eaf')
validpgpkeys=()

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
