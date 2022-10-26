# Maintainer: ml <ml@visu.li>
pkgname=mixtool
_commit=4c07d4ed746579ead9eeea5302bf632b5f2e0414
_rev=r82
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
sha256sums=('d86fed1309aec034883c422c88a437b97429c02ea55b7a3ba8beb5112b4b06aa')

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
