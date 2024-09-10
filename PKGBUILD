# Maintainer: Achno <logiaTemp@proton.me>
pkgname=gocheat
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool to create beautiful cheatsheets for your keybinds and aliases"
arch=('x86_64')
url="https://github.com/Achno/gocheat"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Achno/gocheat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  go mod tidy

}

build() {

  cd "$srcdir/$pkgname-$pkgver"
  # export GOPATH="$srcdir/go"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o gocheat

}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gocheat "$pkgdir/usr/bin/gocheat"
}
