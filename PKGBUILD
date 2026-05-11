# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=cone
pkgver=0.0.39
pkgrel=1

pkgdesc='The ConductorOne command line tool'
url='https://github.com/ConductorOne/cone'
arch=(any)
license=(Apache-2.0)

#epends=()
makedepends=('go')
source=("https://github.com/ConductorOne/cone/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(97ba0d89714447d2042bb80ddbec6b90b00cd30895184d740855a1e35543f8d6)


build() {
  cd "${pkgname}-${pkgver}"
  export BUILD_VERSION=${pkgver}
  make build
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  GOARCH=$(go env GOARCH)
  install -Dm 755 "$srcdir/${pkgname}-${pkgver}/dist/linux_${GOARCH}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}

