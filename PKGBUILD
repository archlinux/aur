# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: dianlujitao <dianlujitao at gmail dot com>

pkgname=efm-langserver
pkgver=0.0.50
pkgrel=1
pkgdesc='General purpose Language Server'
arch=('x86_64')
url=https://github.com/mattn/efm-langserver
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('ctags: for "go to definition" requests')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('9297bfbc870ebcb71d4ff24218ec2326f196b9a07b6fbb96363d41312461566a')

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

check() {
  cd $pkgname-$pkgver
  go test -v ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin efm-langserver
}
