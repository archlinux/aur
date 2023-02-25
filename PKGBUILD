# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=dupefi
pkgver=1.01
pkgrel=1
pkgdesc="A command-line duplicate file finder for linux."
arch=('any')
url="https://github.com/hirak99/dupefi"
license=('Apache')
depends=()
makedepends=('go>=1.18')
provides=('dupefi')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('22ca1a83882a1ae0a3ef6e4fc9ade056')

check() {
  cd "$pkgname"-$pkgver
  scripts/run_tests.sh
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  scripts/build.sh
}

package() {
  install -Dm755 "$pkgname"-$pkgver/build/dupefi "$pkgdir"/usr/bin/dupefi
}

