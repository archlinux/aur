# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=gengou
pkgver=0.0.9
pkgrel=1
pkgdesc='Find japanese era names / era years'
arch=('x86_64')
url="https://github.com/hachiya-kurisu/$pkgname"
license=('BSD-2-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f93e5f7a049ebeb0f55ff3fe871afee2496ee18863cdb9632241b53079b6ee02')
makedepends=('go')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'
  go build -o "build/$pkgname" "cmd/$pkgname/main.go"
}

check() {
  cd "$pkgname-$pkgver"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
