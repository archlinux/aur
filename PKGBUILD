# Maintainer: ml <ml@visu.li>
pkgname=mixtool
_commit=4c3a8416095b4ef1a4b87a267d71f97961beb277
_rev=r58
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
sha256sums=('1a09875b9a9cd0d3bb9b74f0814e370ebc83343f2a4c784d836c9a6a835bebd9')

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
