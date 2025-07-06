# Maintainer: Wagner Skellington <kelson dot glint at gmail dot com>
# Contributor: Junker

pkgname=nom
pkgver=2.11.0
pkgrel=1
pkgdesc='RSS reader for the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/guyfedwards/nom'
license=('GPL-3')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6acd37f644ae8e5a89dc06b805a238930e6431ce47a88ddc08e9477a48ff52aa')

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
