# Maintainer: ml <>
pkgname=golang-mockery
pkgver=2.10.0
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a3dcfa1f0599858bbc3ac1cdb17a09702ce0236fd329ddad80f975b8ee11efd1')

build() {
  cd mockery-"$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o mockery -ldflags "-linkmode=external -X github.com/vektra/mockery/v2/pkg/config.SemVer=$pkgver" main.go
}

package() {
  cd mockery-"$pkgver"
  install -Dm755 mockery -t "$pkgdir/usr/bin"
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
