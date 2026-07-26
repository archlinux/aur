# Maintainer: Han <tabularasa8931@gmail.com>
pkgname=gorae
pkgver=2.3.2
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
sha256sums=('5711bc0a19085fefa4e2e62ed169c283accdc4528151ad3c2366f2b2f24a99c7')

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
