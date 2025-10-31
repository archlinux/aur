# Contributor ringo <ringo@deqc.xyz>
# Contributor: Atte Lautanala <atte@lautana.la>
# Contributor: Trevor Mosey <trevor dot mosey at gmail dot com>

pkgname=flyctl
pkgver=0.3.206
pkgrel=1
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://github.com/superfly/flyctl"
license=("Apache-2.0")
makedepends=(go)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('fa45639cb276cc183a989b2688bdd1c7727d7926317aed3c2acc8ceb9ac4d3e8222ae07c94937e8dfd38b0492864c2e077314a60ee51b28fedd7392424cc2142')

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
