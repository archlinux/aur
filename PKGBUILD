# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=virtualgo
_reponame=vg
pkgver=0.6.5
pkgrel=1
pkgdesc="Easy and powerful workspace-based development for Go"
arch=('i686' 'x86_64')
_vendor="github.com/GetStream/${_reponame}"
url="https://${_vendor}"
license=('MIT')
makedepends=('dep' 'go')
options=('!emptydirs' '!strip')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('875b556b47153b018d797da75168070c7f3a435b8d42737cf444630fef4a2b6d')

_vendorpath="gopath/src/$_vendor"

prepare() {
  export GOPATH="$srcdir/gopath"
  mkdir -p $_vendorpath
  mv -T $_reponame-$pkgver $_vendorpath
  cd $_vendorpath
  dep ensure
}

build() {
  export GOPATH="$srcdir/gopath"
  cd $_vendorpath
  go build -o bin/$_reponame
}

package() {
  install -Dm755 $_vendorpath/bin/$_reponame $pkgdir/usr/bin/$_reponame
  install -Dm644 $_vendorpath/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
