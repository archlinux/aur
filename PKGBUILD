# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=docker-machine-driver-scaleway
pkgver=1.6
pkgrel=1
pkgdesc="Scaleway driver for Docker Machine "
arch=('i686' 'x86_64')
url="https://scaleway.com"
license=('MIT')
depends=('docker-machine')
makedepends=('go' 'git')
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('9d27fe10c2169ffa2a7de79d65ce5a682f36ca75e1a98681b93b84b34ed8a22d')

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
