# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout
pkgver=0.15.0
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
b2sums=('ec155e0630565460d3510a76be588f36f8cd94bd666e4aaa6ec5c743600f0204b37cc8bf5b03bd356dcdafdb03fa590a1f0ba6fc8ff7391124c46f21c7d7ab69')


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
