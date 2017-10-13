# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=bcrypt-tool
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple command line tool for generating bcrypted passwords."
url="https://github.com/coreos/bcrypt-tool"
arch=("i686" "x86_64")
license=("Apache")
makedepends=("go-pie" "glide" "git")
_gourl="github.com/coreos"
source=("https://github.com/coreos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("c69a7d4867627711686f1f7ebe9171ec127454e2151c82d254ca949120f1c1f6")

prepare() {
  mkdir -p "$srcdir/src/$_gourl"
  rm -rf "${srcdir}/src/$_gourl/$pkgname"
  mv -f "$pkgname-$pkgver" "$srcdir/src/$_gourl/$pkgname"
  cd "$srcdir/src/$_gourl/$pkgname"
  GOPATH="$srcdir" glide install
}

build() {
  cd "$srcdir/src/$_gourl/$pkgname"
  GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" go build ./
}

package() {
  cd "$srcdir/src/$_gourl/$pkgname"
  install -Dm755 bcrypt-tool "$pkgdir/usr/bin/bcrypt-tool"
}
