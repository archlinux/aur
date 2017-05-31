# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=awless
pkgver=0.1.0
pkgrel=1
pkgdesc="A command line interface for Amazon Web Services (AWS)"
arch=('i686' 'x86_64')
_vendor="github.com/wallix/${pkgname}"
url="https://${_vendor}"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('2b378e4d02205117e8f984601a6d437cb83c98ee0dbf1643813669332719fb9f')

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
