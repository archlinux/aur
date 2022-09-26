# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=dupefi
pkgver=1.0
pkgrel=1
pkgdesc="A command-line duplicate file finder for linux."
arch=('any')
url="https://github.com/hirak99/dupefi"
license=('Apache')
depends=()
makedepends=('go>=1.18')
provides=('dupefi')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  scripts/build.sh
}

check() {
  cd "$pkgname"-$pkgver
  scripts/run_tests.sh
}

package() {
  install -Dm755 "$pkgname"-$pkgver/build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

