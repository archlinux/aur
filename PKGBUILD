# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=neocities
pkgver=0.0.3
pkgrel=1
pkgdesc="A neocities.org client written in Go"
arch=('any')
url="https://github.com/peterhellberg/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('588143b86d5d3b9c94a2ab7d06bbbb48ee30043221867744cf83a21deafc6283')

prepare() {
  mkdir -p gopath/src/github.com/peterhellberg
  ln -rTsf "$pkgname-$pkgver" gopath/src/github.com/peterhellberg/$pkgname
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/peterhellberg/$pkgname
  go get
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
