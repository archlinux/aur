# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.33.0
pkgrel=3
pkgdesc="Command Line Tool for Mackerel"
arch=('i686' 'x86_64')
url="https://github.com/mackerelio/mkr"
license=('APACHE')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mackerelio/mkr/archive/v${pkgver}.tar.gz"
        "alerts.go.patch")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  export PATH="$PATH:$GOPATH/bin"

  # Apply changes for alerts.go:
  # - https://github.com/mackerelio/mkr/pull/178
  # - https://github.com/mackerelio/mkr/pull/179
  patch -p0 < ../alerts.go.patch

  make build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  export PATH="$PATH:$GOPATH/bin"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 mkr "$pkgdir/usr/bin/mkr"
}

sha512sums=('9dcd299e3bb5640a78b221c303a419a00f9e3203a8f607ee536a74fd37632a6d89e312d1725651e8157936b07d7e5509922b7920a8da65fff8a2c82669aa09a8'
            'ea4cd9f4a93bbe633e80dd63e2e43f44ca0f7e172cdebf99fbecae369f5fa26937034429dd77ea466cb281bb34450234dac1b9b01466ac364eefe98c36e28958')

# vim: set et sw=2 sts=2:
