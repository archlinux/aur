# Maintainer: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc='Local Kubernetes development with no stress'
pkgver=0.17.7
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/windmilleng/tilt'
optdepends=('kubectl')
makedepends=('go' 'nodejs' 'yarn')
conflicts=('tilt-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/windmilleng/tilt/archive/v$pkgver.tar.gz")
sha256sums=('747b5a1f95f5c1ccd9d9352354d17e3682ff5edb83ad1da5f9cdd339e550696c')

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
