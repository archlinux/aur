# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout
pkgver=0.16.1
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
b2sums=('93e93bbcd70330eb5780012196e174c085376a0dc600e462ff3b8dfb9ca37c7a90af929a7e1a419d86c654e10c1cec0e0851c972880b47218d1fb59fab6c6eae')


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
