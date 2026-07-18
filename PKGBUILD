# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=livekit-cli
pkgver=2.18.0
pkgrel=1
pkgdesc='LiveKit CLI: command line utilities that interacts with LiveKit'
arch=(x86_64)
url='https://livekit.io/'
license=(Apache)
depends=(portaudio)
makedepends=(go)
source=(
  "https://github.com/livekit/livekit-cli/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '827990eb053a10bde94432894092b725f72658959a609cf607dea9c9898510dc'
)

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw "
  go build -tags portaudio_system -ldflags "-w -s" -o ./bin/lk ./cmd/lk
}

package() {
  install -vDm755 "${pkgname}-${pkgver}/bin/lk" -t "$pkgdir/usr/bin"
}
