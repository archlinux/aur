# Maintainer: ml <ml@visu.li>
pkgname=mixtool
_commit=3c25f120db2c681f2d9ff5b8cbfa34dc4d5027e7
_rev=r63
# VERSION file contains 'v0.1.0-pre' but no tag exists upstream
# so this will remain 0.0.0.rREVISION.gSHORTSHA
pkgver=0.0.0.$_rev.g${_commit:0:12}
pkgrel=1
pkgdesc='helper for easily working with jsonnet mixins'
arch=(x86_64)
url=https://github.com/monitoring-mixins/mixtool
license=('Apache')
depends=('glibc')
makedepends=('go')
#backup=()
source=("$url"/archive/"$_commit"/"$pkgname-$pkgver.tar.gz")
sha256sums=('ebacc7a78dae2f3f43cbf7831d3153047744a2043611425f37f183f0cb9be6bc')

build() {
  cd "$pkgname-$_commit"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -ldflags="-linkmode=external -X=main.version=$(<VERSION)" ./cmd/mixtool
}

package() {
  cd "$pkgname-$_commit"
  install -Dm755 mixtool -t "$pkgdir"/usr/bin
}
