# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: dianlujitao <dianlujitao at gmail dot com>

pkgname=efm-langserver
pkgver=0.0.22
pkgrel=1
pkgdesc='General purpose Language Server'
arch=('x86_64')
url=https://github.com/mattn/efm-langserver
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('5f29002c3fd80a759102201fac9e973dfe134cab53c96ace10b8a6d06dd690141b0f2e867174a634492c3c5eb87c2f389393a13ced4cb87d1c3781b58b946740')

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

check() {
  cd $pkgname-$pkgver
  go test -v ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin efm-langserver
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname README.md # Only mention of license
}
