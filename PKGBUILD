# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kbtui
pkgdesc="Keybase TUI written in Go"
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/Rudi9719/kbtui"
license=('GPL3')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('de520f9be01e237eb5401f2705badd6c5a41f297e8bf705538b7221fb403b46d582f6af7b9a78d57382a15128e457dd2f4c03dbf48259fa216932ba823a416d6')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go get -d ./...
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
