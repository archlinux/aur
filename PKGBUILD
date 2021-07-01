# Maintainer: Martin Mariano <contato@martinmariano.com>

_stdname=MeiliSearch
pkgname=meilisearch-latest
_pkgname=meilisearch
pkgver=0.21.0rc1
pkgrel=1
pkgdesc="Lightning Fast, Ultra Relevant, and Typo-Tolerant Search Engine. Release Candidate."
arch=(x86_64)
url="https://docs.meilisearch.com/"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/meilisearch/MeiliSearch/archive/v${pkgver}.tar.gz)
sha256sums=('8abb0bb0c8cd055f62ab120c9496c9ddd106f7ca75d67022028ca67916ac2eb1')

validpgpkeys=()

build() {
  cd "$_stdname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$_stdname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_stdname-$pkgver"
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
