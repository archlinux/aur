# Maintainer: vghbjc

pkgname=edh-logger-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI to log MTG Commander games & view stats (edh --help for usage)"
arch=('x86_64')
url=https://github.com/GhelloZ/edhstats/
license=('GPL-3.0-only')

# Tarball and sha256sum
source=("https://github.com/GhelloZ/edhstats/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fae3c02c25c991f0d7bbac44ca5de152b5ac4b73425e41167d243399c4848a36')

# Build dependencies
makedepends=('make' 'gcc' 'go')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -buildmode=pie -mod=readonly -ldflags=-linkmode=external"
  go build -o edh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 edh "${pkgdir}/usr/bin/edh"
}
