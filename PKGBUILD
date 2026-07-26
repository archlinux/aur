# Maintainer: Han <tabularasa8931@gmail.com>
pkgname=gorae
pkgver=2.3.0
pkgrel=1
pkgdesc="Terminal-first knowledge base for PDFs, EPUBs, and Markdown — with a built-in AI assistant"
arch=('x86_64')
url="https://github.com/Han8931/gorae"
license=('MIT')
depends=('poppler')
makedepends=('go>=1.21')
optdepends=(
  'chafa: ASCII/sixel preview fallback for non-Kitty/iTerm2 terminals'
  'zathura: recommended PDF viewer with vi-style navigation'
  'zathura-pdf-mupdf: MuPDF backend for zathura'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Han8931/gorae/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('069ebb78fe7ff01ad246deb8a2e680a0201d9eae7262ce22291e19313e4c2c9c')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -buildvcs=false"
  go build -ldflags="-s -w" -o "build/$pkgname" ./cmd/gorae
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname"   "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md          "$pkgdir/usr/share/doc/$pkgname/README.md"
}
