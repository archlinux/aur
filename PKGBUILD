# Maintainer: Stipe Kotarac <stipe@kotarac.net>
# Contributor: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=docker-machine-driver-hetzner
pkgver=5.0.2
pkgrel=1
pkgdesc="Hetzner driver for Docker Machine"
arch=('x86_64')
url="https://github.com/JonasProgrammer/docker-machine-driver-hetzner"
license=('MIT')
depends=('docker-machine')
makedepends=('go')
source=("https://github.com/JonasProgrammer/$pkgname/archive/${pkgver}.tar.gz")

prepare() {
  mkdir -p "$srcdir/src/github.com/JonasProgrammer"
  cp -r "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/JonasProgrammer/$pkgname"
  cd "$srcdir/src/github.com/JonasProgrammer/$pkgname"
  GOPATH="$srcdir" go get -d
}

build() {
  cd "$srcdir/src/github.com/JonasProgrammer/$pkgname"
  GOPATH="$srcdir" go build -o "$pkgname"
  GOPATH="$srcdir" go clean -modcache
}

package() {
  install -Dm755 "$srcdir/src/github.com/JonasProgrammer/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/src/github.com/JonasProgrammer/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('8df11bde7d96f7d0adceb2d97cd5fb117372259cd528b3f582dc0e6094ded409')
