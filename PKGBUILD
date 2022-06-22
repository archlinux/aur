# Maintainer: ml <>
pkgname=jsonnet-bundler
pkgver=0.5.1
pkgrel=1
pkgdesc='jsonnet package manager'
arch=('x86_64')
url='https://github.com/jsonnet-bundler/jsonnet-bundler'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('059ff88a4b8617bd8a6802a337ec6aaffd4aece10f74e53f1f3ce0b4588ac4c4')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=vendor'
  go build -ldflags "-linkmode=external -X=main.Version=v$pkgver" ./cmd/jb
}

package() {
  install -Dm755 "$pkgname-$pkgver"/jb -t "$pkgdir"/usr/bin
}
