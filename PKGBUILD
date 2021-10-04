# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Jonas Malaco <jonas@protocubo.io>

pkgname=vgrep
pkgver=5.2.2
pkgrel=1
pkgdesc="Reimpementation of the ancient cgvg perl scripts"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('go')
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5132ef6b254bfb8535b4021c297aaeafa1e641de5ab3d1ba0e1748586f97d192')

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
