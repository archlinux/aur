# Maintainer: Chris Salzberg <chris@dejimata.com>

pkgname=docker-machine-driver-linode
pkgver=0.0.12
pkgrel=1
pkgdesc="Linode driver for Docker Machine"
url="https://github.com/linode/docker-machine-driver-linode"
license=('MIT')
arch=('x86_64')
depends=(
  'docker-machine'
  'go'
)
optdepends=(
  'docker: to manage the containers in the machine'
)
makedepends=()

source=("https://github.com/linode/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/src/github.com/linode/"
  ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/linode/$pkgname"

  cd "$srcdir/src/github.com/linode/$pkgname"

  GOPATH="$srcdir" go get -v -d
}

build() {
  cd "$srcdir/src/github.com/linode/$pkgname"
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 docker-machine-driver-linode "$pkgdir/usr/bin/docker-machine-driver-linode"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
