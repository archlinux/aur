# Maintainer: rawkode <david@rawkode.dev>

pkgname=fluxlang
pkgdir="pkg-build"
pkgdesc="InfluxData's Flux Language"
pkgver=0.28.3
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/influxdata/flux"
license=('mit')
makedepends=('go' 'dep' 'make' 'ragel' 'ruby')

source=("https://github.com/influxdata/flux/archive/v$pkgver.tar.gz")
sha256sums=('b0332f395303578acda2fb8fb675c959c982588cd57861ceb8cd8881744293fd')

build() {
  GOPATH=$startdir
  rm -rf $GOPATH/pkg || true
  cd "$srcdir/flux-$pkgver"

  GO111MODULE=on go build ./cmd/flux
}

package() {
  install -Dm 755 "$srcdir/flux-$pkgver/flux" "$pkgdir/usr/bin/flux"
}
