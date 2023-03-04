# Maintainer: Stipe Kotarac <stipe@kotarac.net>
# Contributor: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=docker-machine-driver-hetzner
pkgver=3.12.1
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

sha256sums=('a6ef7dfae70c66a19fb6dfb0f3c2f9ec07aa672a885d428de9050481f96c5c3a')
