# Contributor ringo <ringo@deqc.xyz>
# Contributor: Atte Lautanala <atte@lautana.la>
# Contributor: Trevor Mosey <trevor dot mosey at gmail dot com>

pkgname=flyctl
pkgver=0.3.203
pkgrel=1
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://github.com/superfly/flyctl"
license=("Apache-2.0")
makedepends=(go)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('d1e5363a741c9b41c1545d84fe3803cad78b255f60afdc3037c66ee0927f2e0584ca19050b7415a332fec8a60c8481842c502af9980bad9210fb359c9608cf5b')

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make VERSION=$pkgver build
}

check() {
  make -C "$pkgname-$pkgver" test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "bin/flyctl" "$pkgdir/usr/bin/flyctl"
  ln -s "/usr/bin/flyctl" "$pkgdir/usr/bin/fly"
}
