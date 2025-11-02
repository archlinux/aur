# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=livekit-cli
pkgver=2.12.3
pkgrel=1
pkgdesc='LiveKit CLI: command line utilities that interacts with LiveKit'
arch=(x86_64)
url='https://livekit.io/'
license=(Apache)
makedepends=(go)
source=(
  "https://github.com/livekit/livekit-cli/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '92f45dd477002470241eee7bc1b7a3a83ef76da6a09f8018b79310a58cc5fb46'
)

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-w -s" -o ./bin/lk ./cmd/lk
  GOOS=linux GOARCH=amd64 go build -o ./bin/lk-linux ./cmd/lk
}

package() {
  install -vDm755 "${pkgname}-${pkgver}/bin/lk" -t "$pkgdir/usr/bin"
}
