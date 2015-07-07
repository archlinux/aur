# Maintainer: aksr <aksr at t-com dot me>
pkgname=codesearch-git
pkgver=r26.a45d81b
pkgrel=1
epoch=
pkgdesc="A tool for indexing and then performing regular expression searches over large bodies of source code."
arch=('i686' 'x86_64')
url="https://github.com/google/codesearch"
license=('BSD 3-Clause')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=('codesearch')
conflicts=('codesearch')
_gourl=github.com/google/codesearch/cmd/...

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "bin/"* "$pkgdir/usr/bin"
  cd "$srcdir/src/github.com/google/codesearch"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

