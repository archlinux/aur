# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=docker-machine-driver-scaleway
pkgver=1.3
pkgrel=2
pkgdesc="Scaleway driver for Docker Machine "
arch=('i686' 'x86_64')
url="https://scaleway.com"
license=('MIT')
depends=('docker-machine')
makedepends=('go' 'git')
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('e30253c38cb3f43e66be2ca6dd9f58da870237002ee7a9a4a57d3a29bf45a0da')

prepare() {
  mkdir -p "$srcdir/src/github.com/scaleway/"
  ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/scaleway/$pkgname"

  cd "$srcdir/src/github.com/scaleway/$pkgname"

  GOPATH="$srcdir" go get -v -d
}

build() {
  cd "$srcdir/src/github.com/scaleway/$pkgname"
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 docker-machine-driver-scaleway "$pkgdir/usr/bin/docker-machine-driver-scaleway"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
