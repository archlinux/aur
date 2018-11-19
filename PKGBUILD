# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=docker-machine-driver-scaleway
pkgver=1.5
pkgrel=1
pkgdesc="Scaleway driver for Docker Machine "
arch=('i686' 'x86_64')
url="https://scaleway.com"
license=('MIT')
depends=('docker-machine')
makedepends=('go' 'git')
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('47fdd25c2439b2dcc26700b8dc833a768b6ab10c8dfe9964e9c0aa52ad574b2f')

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
