# Maintainer: Wagner Skellington <kelson dot glint at gmail dot com>
# Contributor: Junker

pkgname=nom
pkgver=2.18.0
pkgrel=1
pkgdesc='RSS reader for the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/guyfedwards/nom'
license=('GPL-3')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('414f3e5285fce2e15879f1f33ffabc05c2e67fea633a64e16d8f344bd499b08c')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/nom
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 nom "$pkgdir"/usr/bin/nom
}
