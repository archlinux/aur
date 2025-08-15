# Maintainer: Ailton Baúque <ailtonbauque@outlook.com>

pkgname=vygrant
pkgver=0.0.1
pkgrel=1
pkgdesc="vygrant - OAuth2 authentication daemon"
arch=('x86_64' 'i686')
url="https://github.com/vybraan/vygrant"
license=('MIT')
depends=('go' 'git')
makedepends=('go')
provides=('vygrant')
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
  go build -o vygrant main.go
}
package() {
  install -Dm755 "$srcdir/$pkgname/vygrant" "$pkgdir/usr/bin/vygrant"
  install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}


