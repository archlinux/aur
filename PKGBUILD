# Maintainer: vghbjc

pkgname=edh-logger-cli
pkgver=404:NotFound
pkgrel=1
pkgdesc="CLI to log MTG Commander games & view stats (edh --help for usage)"
arch=('x86_64')
url=https://github.com/GhelloZ/edh-logger-cli
license=('GPL-3.0-only')

# Upstream repo name
_upstream="edh-logger-cli"

# Tarball and sha256sum
source=("https://github.com/GhelloZ/edh-logger-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0dd0817f29af53e844ac89781ee334533440102bd30e85d807fc0a4c76624c32')

# Build dependencies
makedepends=('go' 'make' 'sqlite' 'gcc')

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
  echo "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 build/edh "${pkgdir}/usr/bin/edh"
  echo "${pkgdir}/usr/bin/edh"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
