# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=go-hass-agent
pkgver=13.3.3
pkgrel=1
pkgdesc="A Home Assistant, native app for desktop/laptop devices."
arch=('x86_64')
url="https://github.com/joshuar/go-hass-agent"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('656ff5ed650fb7f409181a5f7cdf099bb4f4403482828894dcd7476d335ab7a3204ba4bb2aa5a5733fc8657d93d4b2550634491c6988054b16cdcdc71ff134d7')
depends=('libx11' 'libglvnd')
makedepends=('go' 'xorg-server' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libcap')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  install -D -m755 "${pkgname}-${pkgver}"/go-hass-agent "${pkgdir}/usr/bin/go-hass-agent"
  install -D -m644 "${pkgname}-${pkgver}"/README.md "${pkgdir}/usr/doc/go-hass-agent/README.md"
  install -D -m644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/go-hass-agent/LICENSE"
  install -D -m644 "${pkgname}-${pkgver}"/init/go-hass-agent.service "${pkgdir}/usr/lib/systemd/user/go-hass-agent.service"
}
