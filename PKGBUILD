# Maintainer: Olivier Biesmans <o.archlinux@biesmans.fr>

pkgname=bombardier
pkgver=0.2
pkgrel=1
pkgdesc="Crossplatform HTTP benchmarking tool written in Go"
arch=('x86_64' 'i686')
url="https://github.com/codesenberg/bombardier"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/codesenberg/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2ddec6bc421a8688ae388c57bf59183eacac71cb82ac2f3cfda58951cd11ae51')

build() {
  mkdir -p gopath/src
  mv "$pkgname-$pkgver" "gopath/src/$pkgname"
  GOPATH="$(pwd)/gopath" go build -o "$srcdir/build/$pkgname" "$pkgname"
  echo $(pwd)
}

package() {
  install -Dm755 "$srcdir/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/gopath/src/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
