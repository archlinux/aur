# Maintainer: BrainDamage
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Jonas Malaco <jonas@protocubo.io>

pkgname=vgrep
pkgver=2.7.0
pkgrel=1
pkgdesc="pager for grep, git-grep, ripgrep and similar, allows for opening the indexed file locations in a user-specified editor"
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('go')
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0fb2ca6df8cdbb57bc50589e626e456f8a62b2d8d545b93425070844fcff26ea')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o build -ldflags "-linkmode=external -X main.version=${pkgver}" ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dvm 755 "build/${pkgname}" -t "${pkgdir}/usr/bin"
}

# vim: ts=2:sw=2:et
