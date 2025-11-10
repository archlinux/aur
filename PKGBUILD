# Maintainer: Inc44
pkgname=dietpdf
pkgver=1.0.0
pkgrel=1
pkgdesc="Reduce PDF file size"
arch=('x86_64')
url="https://github.com/Zigazou/dietpdf-haskell"
license=('BSD-3-Clause')
depends=('libjpeg-turbo' 'imagemagick')
makedepends=('git' 'ghc' 'cabal-install' 'llvm15')
optdepends=('ghostscript' 'grok-jpeg2000' 'ttfautohint')
conflicts=('dietpdf-bin')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  export HOME="$srcdir"
  cd "$srcdir/dietpdf-haskell"
  cabal update
  cabal build --ghc-options="-pgmlo /usr/bin/opt-15 -pgmlc /usr/bin/llc-15" exe:dietpdf
}

package() {
  export HOME="$srcdir"
  cd "$srcdir/dietpdf-haskell"
  cabal install --installdir="$pkgdir/usr/bin" --install-method=copy --overwrite-policy=always --ghc-options="-pgmlo /usr/bin/opt-15 -pgmlc /usr/bin/llc-15" exe:dietpdf
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}