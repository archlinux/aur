# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: dianlujitao <dianlujitao at gmail dot com>

pkgname=efm-langserver
pkgver=0.0.48
pkgrel=1
pkgdesc='General purpose Language Server'
arch=('x86_64')
url=https://github.com/mattn/efm-langserver
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('ctags: for "go to definition" requests')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('39d56178a11c39f865eb2e3677d51af7ac62c79e0b6daa9176dcd8f58a4c0b05')

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
