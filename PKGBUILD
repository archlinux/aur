# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=go-hass-agent
pkgver=14.1.0
pkgrel=1
_commit=e8ddc8f
pkgdesc="A Home Assistant, native app for desktop/laptop devices."
arch=('x86_64')
url="https://github.com/joshuar/go-hass-agent"
license=('MIT')
depends=('libx11' 'libglvnd')
makedepends=('git' 'go' 'xorg-server' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libcap')
source=("go-hass-agent::git+${url}.git#commit=${_commit}?signed")
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')
b2sums=('44b44fe428144c49525aa3de95b49b02348576d3ab7ab446d42ecea495b0e38938d77be6f58fa7ba75d0584eabc5f422a67b5b7a595634299923325e4f77383d')

build() {
  cd "${pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  install -D -m755 "${pkgname}"/go-hass-agent "${pkgdir}/usr/bin/go-hass-agent"
  install -D -m644 "${pkgname}"/README.md "${pkgdir}/usr/share/doc/go-hass-agent/README.md"
  install -D -m644 "${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/go-hass-agent/LICENSE"
  install -D -m644 "${pkgname}"/assets/go-hass-agent.service "${pkgdir}/usr/lib/systemd/user/go-hass-agent.service"
  install -D -m644 "${pkgname}"/assets/start-go-hass-agent.desktop "${pkgdir}/usr/share/applications/start-go-hass-agent.desktop"
}
