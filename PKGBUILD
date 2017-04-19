# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=awless
pkgver=0.0.22
pkgrel=1
pkgdesc="A command line interface for Amazon Web Services (AWS)"
arch=('i686' 'x86_64')
_vendor="github.com/wallix/${pkgname}"
url="https://${_vendor}"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('998343229d6ecdc98514c21e061d93ac6be5d163242754c4c5c83d617214a5b6')

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
