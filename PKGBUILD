# Maintainer: Martin Mariano <contato@martinmariano.com>

_stdname=MeiliSearch
pkgname=meilisearch-latest
_pkgname=meilisearch
pkgver=0.21.0rc6
pkgrel=1
pkgdesc="Lightning Fast, Ultra Relevant, and Typo-Tolerant Seacch Engine. Release Candidate."
arch=(x86_64)
url="https://docs.meilisearch.com/"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/meilisearch/MeiliSearch/archive/v${pkgver}.tar.gz)
sha256sums=('81f5da505a9ba6cf5fcc33f7d17ec46d9f076b10d3cc1fa51919d2169e99bf4d')

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
