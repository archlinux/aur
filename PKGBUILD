# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=jd-tool
_pkgname=jd
pkgver=1.6.0
pkgrel=1
pkgdesc="JSON diff and patch"
arch=('x86_64' 'aarch64')
url="https://github.com/josephburnett/jd"
license=('MIT')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('33c996e962094477169ec247ab5bd9f23a303dd5df40d6d5da39710c77ba97aa')

build() {
  cd $_pkgname-$pkgver

  mkdir -p build/

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  go build -v -o build/jd main.go
}

package() {
  cd $_pkgname-$pkgver

  install -Dm755 "build/jd" "$pkgdir/usr/bin/jd"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/jd/LICENSE"
}
