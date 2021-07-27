# Maintainer: ml <>
pkgname=jsonnet-bundler
pkgver=0.4.0
pkgrel=1
pkgdesc='jsonnet package manager'
arch=('x86_64')
url='https://github.com/jsonnet-bundler/jsonnet-bundler'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bedb42ccacf7922fec47cffc95a1e1999400fd1e6f89d817d9d75b21a60f68e7')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -ldflags "-linkmode=external -X=main.Version=v$pkgver" ./cmd/jb
}

package() {
  install -Dm755 "$pkgname-$pkgver"/jb -t "$pkgdir"/usr/bin
}
