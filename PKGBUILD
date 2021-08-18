# Maintainer: ml <>
_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.10.1
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://ooni.org/'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("https://github.com/ooni/probe-cli/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('2b81c14133f39ac91c4ea6761be7a27d768cd88989b52ae72376d1d7b69de322')

build() {
  cd "$_pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-ldflags=-linkmode=external -buildmode=pie -trimpath -modcacherw'
  go build ./cmd/ooniprobe
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 ooniprobe -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
