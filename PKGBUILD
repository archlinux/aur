# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=go-hass-agent
pkgver=14.8.0
pkgrel=1
_commit=dd0d2cf
pkgdesc="A Home Assistant, native app for desktop/laptop devices."
arch=('x86_64')
url="https://github.com/joshuar/go-hass-agent"
license=('MIT')
depends=('dbus' 'libcap')
makedepends=('git' 'go')
source=("go-hass-agent::git+${url}.git#commit=${_commit}?signed")
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')
b2sums=('ca8087c8cb855470817539499462d70ca5913ae477ae7bc22e1ccc1c8be77fd39073dc485518e0ba48930e1b590cd90e15250255e7d083aaf5f872808fc9d82b')

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
