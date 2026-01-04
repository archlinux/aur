# Maintainer: Kenzo <https://github.com/codewithkenzo>
pkgname=pplx-zero
pkgver=2.4.0
pkgrel=1
pkgdesc="Fast, minimal Perplexity AI CLI with local RAG. Stream answers, analyze PDFs/images, search your own notes."
arch=('any')
url="https://github.com/codewithkenzo/pplx-zero"
license=('MIT')
depends=('bun')
source=("$pkgname-$pkgver.tar.gz::https://github.com/codewithkenzo/pplx-zero/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24cdb1b161e55ab2c8f8b57f6de61d63c8e96bdb75be26792199879ac463c304')

build() {
  cd "$pkgname-$pkgver"
  bun install --frozen-lockfile
  bun build src/index.ts --compile --outfile=pplx
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 pplx "$pkgdir/usr/bin/pplx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
