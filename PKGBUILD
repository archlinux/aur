# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=antidot
pkgver=0.6.2
pkgrel=1
pkgdesc='Cleans up your $HOME from those pesky dotfiles'
arch=('x86_64')
url="https://github.com/doron-cohen/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("https://github.com/doron-cohen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a203c50f8e5f407769d3897ac6965c01b8291757bc0b2ce2e2b6a0b996dabf9e0fed09e69c6db7157bed48171bdeb9d1fcb4dd6b6e2b2bbd5d6f7b3264f12202')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
