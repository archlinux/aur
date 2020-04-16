# Maintainer: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc='Local Kubernetes development with no stress'
pkgver=0.13.2
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/windmilleng/tilt'
optdepends=('kubectl')
makedepends=('go' 'nodejs' 'yarn')
conflicts=('tilt-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/windmilleng/tilt/archive/v$pkgver.tar.gz")
sha256sums=('45d02283def527bcd9c1edcafdf9613967b86ea9e2c00b68eccf324deb010b94')

build() {
  cd $pkgname-$pkgver

  make ensure build build-js

  go build \
    -trimpath \
    -ldflags "-X main.version=$pkgver -X main.date=$(date --iso-8601)" \
    -o tilt \
    cmd/tilt/main.go
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
