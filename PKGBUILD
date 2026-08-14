# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout
pkgver=0.14.0
pkgrel=1
pkgdesc="Cloudflare WARP endpoint scanner"
arch=(aarch64 x86_64)
url="https://github.com/vernette/$pkgname"
license=(MIT)
depends=(
  ca-certificates
  glibc
)
makedepends=(go)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('cdb7db00b0f5be592f4b3e3596bfa122a0de4413b63b8fd6dfef9fc2b40e26bb0b9ef49ee2cecf9752431d287ce5a7273461c059c51fe6c381a7584e81aaf840')


build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS=$CFLAGS
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/$pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 build/$pkgname -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE        -t "$pkgdir"/usr/share/licenses/$pkgname/
}
