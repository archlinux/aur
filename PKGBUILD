# Maintainer: orhun <github.com/orhun>

_pkg=god
pkgname=god-git
pkgdesc="Utility for simplifying the Git usage"
pkgver=1.5
pkgrel=1
arch=('any')
url="https://github.com/orhun/god"
license=('GPL3')
depends=('git')
makedepends=('go>=1.7')
source=('git://github.com/orhun/god.git')
sha256sums=('SKIP')

build() {
  cd $_pkg
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkg .
}

package() {
  cd $_pkg
  install -Dm755 $_pkg $pkgdir/usr/local/bin/$_pkg
}