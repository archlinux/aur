# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=archiver
pkgver=3.3.2
_tagcommit="c7eae9dcbcb1f0a0ce965184868097babf73d415"
_tagdate="29 Sept 2020"
pkgrel=1
pkgdesc="A multi-format archive utility written in Go"
arch=("x86_64")
url="https://github.com/mholt/archiver"
license=("MIT")
makedepends=("go-pie")
depends=("glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mholt/archiver/archive/v${pkgver}.tar.gz")
sha256sums=('1d1db34177fa0d85aea6860b33e94700b1acaa2f3ea626e1f457fede6991041b')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -ldflags "-X 'main.version=${pkgver}' -X 'main.commit=${_tagcommit}' -X 'main.date=${_tagdate}' -extldflags ${LDFLAGS}" \
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
