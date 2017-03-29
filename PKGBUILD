# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=awless
pkgver=0.0.21
pkgrel=1
pkgdesc="A command line interface for Amazon Web Services (AWS)"
arch=('i686' 'x86_64')
_vendor="github.com/wallix/${pkgname}"
url="https://${_vendor}"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('04b39738de5c4e28b2e2078e9e76bfdbcfa050f2cb13540a2646229f6f552556')

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
