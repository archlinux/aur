# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=udpx
pkgver=1.0.7
pkgrel=1
pkgdesc="Single-packet UDP scanner written in Go"
arch=('x86_64')
url="https://github.com/nullt3r/udpx"
license=('MIT')
depends=(
  'glibc'
)
makedepends=(
  'go>=1.17'
  'git'
)
source=("git+$url#tag=v$pkgver")
b2sums=('2b5200f81d8e90764ba7cbfd9cc4096d76a55b9a2e3f726a6d7a48944a1d8699c2f6f9a8a3b273edc732fb78859e505c1a647add47380e200197a5135163912d')

build() {
  cd udpx
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go build -ldflags "-compressdwarf=false -linkmode external" ./cmd/udpx
}

package() {
  cd udpx
  install -Dm0755 -t "$pkgdir/usr/bin" udpx
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim: ts=2 sw=2 et:
