# Maintainer: BrainDamage
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Jonas Malaco <jonas@protocubo.io>

pkgname=vgrep
pkgver=2.8.0
pkgrel=1
pkgdesc="pager for grep, git-grep, ripgrep and similar, allows for opening the indexed file locations in a user-specified editor"
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('go')
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('325b28bd5e8da316e319361f2dd8e3cc74fcd55724fc8ad4b2a73c21b2903bd8')

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
