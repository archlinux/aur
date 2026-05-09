# Maintainer: typechecks
pkgname=anitui
pkgver=0.1.2
pkgrel=1
pkgdesc="a tui for browsing and streaming anime"
arch=('x86_64' 'aarch64')
url="https://github.com/typechecks/anitui"
license=('GPL-3.0-only')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/typechecks/anitui/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
optdepends=(
  'mpv: media player for streaming'
  'vlc: media player for streaming'
  'haruna: media player for streaming'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -ldflags="-s -w -X github.com/anitui/anitui/internal/tui.Version=${pkgver}" -o anitui ./cmd/anitui
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/anitui" "${pkgdir}/usr/bin/anitui"
  install -Dm644 /dev/null "${pkgdir}/usr/share/anitui/.package-manager"
}
