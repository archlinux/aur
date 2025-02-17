# Maintainer: ml <>
pkgname=jsonnet-bundler
pkgver=0.6.0
pkgrel=1
pkgdesc='jsonnet package manager'
arch=('x86_64')
url='https://github.com/jsonnet-bundler/jsonnet-bundler'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('116ab7d6e6090d973998f69ace133c247ae36373fbffe5cb3dce668615b31dea')

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
