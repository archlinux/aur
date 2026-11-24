# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout
pkgver=0.17.0
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
b2sums=('30c409a804b39dc1f115647bd57c3e7878bd9baa8f680cdac4d93b863bbdc4818b67e94ef1dd8fa07f1cc113a611ffc62159961dfd1c39ca3b5b8c6d0e759399')


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
