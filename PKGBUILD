# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Jonas Malaco <jonas@protocubo.io>

pkgname=vgrep
pkgver=2.4.0
pkgrel=2
pkgdesc="Reimpementation of the ancient cgvg perl scripts"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('go')
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d0dd594156638158f7163d37169dd02e3a82eabfa6c8f57d6eb1dfa89c669c03')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build/

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o build -ldflags "-linkmode=external -X main.version=${pkgver}" ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

# vim: ts=2:sw=2:et
