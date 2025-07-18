# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=netrc
pkgver=0.10.2
pkgrel=2
pkgdesc='Utility that allows users to manage netrc files'
arch=('x86_64')
url='https://github.com/dokku/netrc'
license=('MIT')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ce016acef7e82556656f416708e2f9397b060b39dbb3647f3cc8bbc6dc06615')

build() {
  cd "${pkgname}-${pkgver}"

  # Build executable
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-asmflags=-trimpath=/src -gcflags=-trimpath=/src"
  go build -a -ldflags "-s -w -X main.Version=${pkgver}" -o "${pkgname}-build" .
}


package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}-build" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
