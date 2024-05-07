# Maintainer: Den Ivanov <securityxiii@gmail.com>
# Contributor: Luan Santos <aur@luan.sh>

pkgname=bosh-7-cli
pkgver=7.5.6
pkgrel=1
pkgdesc="BOSH command line interface tool"
arch=('i686' 'x86_64')
url="https://bosh.io/"
license=('Apache2')
depends=()
makedepends=('go')
optdepends=('openssh: bosh ssh')
source=("https://github.com/cloudfoundry/bosh-cli/archive/v${pkgver}.tar.gz")
sha256sums=('9cb4d8652d6bd3700e34170afca3cee31143e70ac588dd310b4122c2f1be53c6')

build() {
  mkdir -p gopath/src/github.com/cloudfoundry
  mv bosh-cli-$pkgver gopath/src/github.com/cloudfoundry/bosh-cli
  cd gopath/src/github.com/cloudfoundry/bosh-cli
  GOPATH=$srcdir/gopath bin/build
  mv out/bosh $srcdir/bosh
  rm -rf $srcdir/gopath
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/bosh" "$pkgdir/usr/bin"
}

