# Maintainer: Luan Santos <aur@luan.sh>

pkgname=bosh-cli
pkgver=2.0.40
pkgrel=1
pkgdesc="BOSH command line interface tool"
arch=('i686' 'x86_64')
url="https://bosh.io/"
license=('Apache2')
depends=()
makedepends=('go')
optdepends=('openssh: bosh ssh')
source=("https://github.com/cloudfoundry/bosh-cli/archive/v${pkgver}.tar.gz")
sha256sums=('8ac3e0fd243f78fd56a67c48bd6f44896c16667f274b3f112362fa9bbe840851')

build() {
  mkdir -p gopath/src/github.com/cloudfoundry
  mv $pkgname-$pkgver gopath/src/github.com/cloudfoundry/bosh-cli
  cd gopath/src/github.com/cloudfoundry/bosh-cli
  GOPATH=$srcdir/gopath bin/build
  mv out/bosh $srcdir/bosh
  rm -rf $srcdir/gopath
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/bosh" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
