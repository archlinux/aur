# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Terin Stock <terinjokes@gmail.com>

pkgname=archiver
pkgver=3.5.0
pkgrel=1
pkgdesc="Easily create & extract archives, and compress & decompress files of various formats"
arch=("x86_64")
url="https://github.com/mholt/archiver"
license=("MIT")
makedepends=("go")
depends=("glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mholt/archiver/archive/v${pkgver}.tar.gz")
sha256sums=('8f2e3ad68553f6b58bf99e8635ff0953f62ff0a7804da7658954ffaa7d0aaa0a')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
	-buildmode=pie \
	-mod=readonly \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
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
