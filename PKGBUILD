# Maintainer: vghbjc

pkgname=edh-logger-cli
pkgver=0.2.0
pkgrel=2
pkgdesc="CLI to log MTG Commander games & view stats (edh --help for usage)"
arch=('x86_64')
url=https://github.com/GhelloZ/edh-logger-cli
license=('GPL-3.0-only')

# Ipstream repo name
_upstream="edh-logger-cli"

# Tarball and sha256sum
source=("https://github.com/GhelloZ/edh-logger-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fae3c02c25c991f0d7bbac44ca5de152b5ac4b73425e41167d243399c4848a36')

# Build dependencies
makedepends=('go' 'make' 'gcc')

build() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -buildmode=pie -mod=readonly -ldflags=-linkmode=external"
  
  make clean && make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 edh "${pkgdir}/usr/bin/edh"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
