# Contributor: Tom Tobin <archlinux@tomxtobin.com>

pkgname=govc
_reponame=govmomi
pkgver=0.16.0
pkgrel=1
pkgdesc="A vSphere CLI built on top of govmomi"
arch=('i686' 'x86_64')
_vendor="github.com/vmware/${_reponame}"
url="https://${_vendor}"
license=('Apache')
makedepends=('go')
options=('!emptydirs' '!strip')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('47c430e5c8a7094e845af9f1cca3c1b149e85e815d35c2017db37a711e34fbe1')

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
