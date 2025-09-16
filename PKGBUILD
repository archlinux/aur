# Maintainer: Sean E. Russell <ser@ser1.net>

pkgname=tjot
pkgver=0.0.8
pkgrel=1
pkgdesc="A terminal renderer for the djot markup language."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hg.sr.ht/~ser/tjot"
license=(BSD 3-clause)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -s -w" \
    -buildmode=pie .
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -Dm755 ${pkgname}        "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md         "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md      "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

sha256sums=('f6794a966164585c4b9e1f50b4e3cbaadbfbb7cd750e419cbc318443d1503a19')
