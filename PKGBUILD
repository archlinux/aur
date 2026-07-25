# Maintainer: PandaDEV <contact at pandadev dot net>

pkgname=sbb-tui
pkgver=1.15.0
pkgrel=1
pkgdesc='TUI client for Swiss public transport timetables'
arch=('x86_64' 'aarch64')
url='https://github.com/Necrom4/sbb-tui'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e4e84f6358c6798e4b69ebb4c079d0c886bc189b839eb818dc31eec0c53b15b')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
