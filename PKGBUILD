# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=docker-machine-driver-hetzner
pkgver=1.2.2
pkgrel=1
pkgdesc="Hetzner driver for Docker Machine "
arch=('i686' 'x86_64')
url="https://github.com/JonasProgrammer/docker-machine-driver-hetzner"
license=('MIT')
depends=('docker-machine')
makedepends=('go' 'git')
source=("https://github.com/jonasprogrammer/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('326d70985d387f3b34a75e3c06cbf5af17e7d8cec0d6a1d3d018c28aaed7e454')

prepare() {
  mkdir -p "$srcdir/src/github.com/jonasprogrammer/"
  ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/jonasprogrammer/$pkgname"

  cd "$srcdir/src/github.com/jonasprogrammer/$pkgname"

  GOPATH="$srcdir" go get -v -d
}

build() {
  cd "$srcdir/src/github.com/jonasprogrammer/$pkgname"
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 docker-machine-driver-hetzner "$pkgdir/usr/bin/docker-machine-driver-hetzner"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
