# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=archiver
pkgver=3.2.0
pkgrel=1
pkgdesc="A multi-format archive utility written in Go"
arch=("x86_64")
url="https://github.com/mholt/archiver"
license=("MIT")
makedepends=("go-pie")
depends=("glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mholt/archiver/archive/v${pkgver}.tar.gz")
sha256sums=('919182c8a2ae8095b12f059a1b2826107629bd13bdba6a429cb3d97eac6ae065')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o . ./cmd/arc/...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 arc -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
