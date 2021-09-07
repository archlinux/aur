# Maintainer: ml <>
pkgname=kubectl-tree
pkgver=0.4.1
pkgrel=1
pkgdesc='Browse object hierarchies as a tree'
arch=('x86_64' 'aarch64')
url='https://github.com/ahmetb/kubectl-tree'
license=('Apache')
depends=('kubectl')
makedepends=('go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bb93d1b00d6688607df6646863c39246814ddce253c075bdb414e7cf4aaac33f')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -ldflags="-linkmode=external -X=main.version=$pkgver" ./cmd/"$pkgname"
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin"
}
