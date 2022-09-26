# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=dupefi
pkgver=r74.f57f0cd
pkgrel=1
pkgdesc="A command-line duplicate file finder for linux."
arch=('any')
url="https://github.com/hirak99/dupefi"
license=('Apache')
depends=()
makedepends=('go>=1.18')
provides=('dupefi')
_name=yaribak
source=("$pkgname::git+https://github.com/hirak99/dupefi")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  scripts/build.sh
}

check() {
  cd "$pkgname"
  scripts/run_tests.sh
}

package() {
  install -Dm755 "$pkgname"/build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

