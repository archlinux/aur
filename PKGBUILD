# Maintainer: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc='Local Kubernetes development with no stress'
pkgver=0.13.4
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/windmilleng/tilt'
optdepends=('kubectl')
makedepends=('go' 'nodejs' 'yarn')
conflicts=('tilt-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/windmilleng/tilt/archive/v$pkgver.tar.gz")
sha256sums=('e44c9d6d72f492937ca7fb50f107488060b275083cba3e6b4a0e9bab9bdde1a5')

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
