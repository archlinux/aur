# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=awless
pkgver=0.0.16
pkgrel=1
pkgdesc="A command line interface for Amazon Web Services (AWS)"
arch=('i686' 'x86_64')
_vendor="github.com/wallix/${pkgname}"
url="https://${_vendor}"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/archive/${pkgver}.tar.gz")
sha256sums=('e75967799392d3b8d1820b74b191ef8db605e301e3a7cc5b2b657d79f05e6075')

_vendorpath="gopath/src/$_vendor"

prepare() {
  mkdir -p $_vendorpath
  mv -T $pkgname-$pkgver $_vendorpath
}

build() {
  export GOPATH="$srcdir/gopath"
  cd $_vendorpath
  go build -o bin/$pkgname
}

package() {
  cd $_vendorpath
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
