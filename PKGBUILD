# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Jonas Malaco <jonas@protocubo.io>

pkgname=vgrep
pkgver=2.6.0
pkgrel=2
pkgdesc="Reimpementation of the ancient cgvg perl scripts"
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('go')
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4cbd912189397b08897fcc1709787ec60ed42275059f900463055211e1f6d689')

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
