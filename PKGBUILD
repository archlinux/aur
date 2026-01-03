# Maintainer: Kenzo <https://github.com/codewithkenzo>
pkgname=pplx-zero
pkgver=2.2.2
pkgrel=1
pkgdesc="Fast, minimal Perplexity AI CLI. Stream answers, analyze PDFs/images, continue conversations."
arch=('any')
url="https://github.com/codewithkenzo/pplx-zero"
license=('MIT')
depends=('bun')
source=("$pkgname-$pkgver.tar.gz::https://github.com/codewithkenzo/pplx-zero/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('722344ffb235dc1ba8e19a8396f3f502e85280791890d2f027d0d1f65cfc7eff')

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
