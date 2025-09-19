# Maintainer: vghbjc

pkgname=edh-logger-cli
pkgver=0.3.3
pkgrel=1
pkgdesc="CLI to log MTG Commander games & view stats (edh --help for usage)"
arch=('x86_64')
url=https://github.com/GhelloZ/edh-logger-cli
license=('GPL-3.0-only')

# Upstream repo name
_upstream="edh-logger-cli"

# Tarball and sha256sum
source=("https://github.com/GhelloZ/edh-logger-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dff7c5178fed10a80429ff91f08ceb704c58df80f218e14c0a612a1d941c9f07')

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
