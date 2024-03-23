# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=antidot
pkgver=0.6.3
pkgrel=1
pkgdesc='Cleans up your $HOME from those pesky dotfiles'
arch=(x86_64)
url="https://github.com/doron-cohen/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d39b0f0faaf2359dc2d15244da124dfc482d8a9f82d76802facf23bec1812e100606f24e5c832815aaf9907c0d8982b93b3894d599c58443113b532fb37a672c')

prepare(){
  cd $pkgname-$pkgver
  mkdir -p build/
}

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
