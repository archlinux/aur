# Maintainer: Wagner Skellington <kelson dot glint at gmail dot com>
# Contributor: Junker

pkgname=nom
pkgver=2.8.1
pkgrel=1
pkgdesc='RSS reader for the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/guyfedwards/nom'
license=('GPL-3')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3d8482a73b86605d02990063122b15b4573cee503a6140745343c400a7f21411')

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
