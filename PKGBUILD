# Maintainer: Ailton Baúque <ailtonbauque@outlook.com>

pkgname=vyai
pkgver=0.1.3
pkgrel=1
pkgdesc="A lightweight CLI tool to interact with the Gemini API from the terminal."
arch=('x86_64' 'i686')
url="https://github.com/vybraan/vyai"
license=('MIT')
depends=('go' 'git')
makedepends=('go')
provides=('vyai')
source=("git+$url")
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "${srcdir}/$pkgname"
  
  go mod download
}

check() {
  cd "${srcdir}/$pkgname"
  
  go test -v ./...
}

build() {
  cd "$srcdir/$pkgname"
  go build -o vyai cmd/main.go
}
package() {
  install -Dm755 "$srcdir/$pkgname/vyai" "$pkgdir/usr/bin/vyai"
  install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}


