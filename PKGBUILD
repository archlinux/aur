# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout
pkgver=0.16.0
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
b2sums=('5bb3bf390d1bfa036604c413364e1415c7f65c579f42b4c60e8f0bb7a1451d2794dfe98a474a418c2d7d25a98529ca647ada31affcf5462c947bd0be36f6bf31')


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
