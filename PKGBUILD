# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=govc
_reponame=govmomi
pkgver=0.15.0
pkgrel=1
pkgdesc="A vSphere CLI built on top of govmomi"
arch=('i686' 'x86_64')
_vendor="github.com/vmware/${_reponame}"
url="https://${_vendor}"
license=('Apache')
makedepends=('go')
options=('!emptydirs' '!strip')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('eb155615dd0437046cc3a3eb45a43aeecb2cde02d363dee5c4cce51e4249cd90')

_vendorpath="gopath/src/$_vendor"

prepare() {
  export GOPATH="$srcdir/gopath"
  mkdir -p $_vendorpath
  mv -T $_reponame-$pkgver $_vendorpath
}

build() {
  export GOPATH="$srcdir/gopath"
  cd $_vendorpath/govc
  go build -o bin/$pkgname
}

package() {
  install -Dm755 $_vendorpath/govc/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
