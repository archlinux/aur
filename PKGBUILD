# Maintainer: ml <>
pkgname=kubectl-neat
pkgver=2.0.3
pkgrel=1
pkgdesc='Clean up Kuberntes yaml and json output to make it readable'
arch=('x86_64' 'aarch64')
url='https://github.com/itaysk/kubectl-neat'
license=('Apache')
depends=('kubectl')
makedepends=('go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d4788cac64102db35c69e21d99a67a08a83848f955cb9bf14fa9a56c49935b4f')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -ldflags=-linkmode=external'
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 demo.png Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
