# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=dep
pkgver=0.3.0
pkgrel=1
pkgdesc="Go dependency management tool"
arch=('i686' 'x86_64')
_vendor="github.com/golang/${pkgname}"
url="https://${_vendor}"
license=('BSD')
makedepends=('go')
options=('!emptydirs' '!strip')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('7d816ffb14f57c4b01352676998a8cda9e4fb24eaec92bd79526e1045c5a0c83')

_vendorpath="gopath/src/$_vendor"
_buildpath="$_vendorpath/cmd/dep"

prepare() {
  mkdir -p $_vendorpath
  mv -T $pkgname-$pkgver $_vendorpath
}

build() {
  export GOPATH="$srcdir/gopath"
  cd $_buildpath
  go build -o bin/$pkgname
}

package() {
  install -Dm755 $_buildpath/bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $_vendorpath/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
