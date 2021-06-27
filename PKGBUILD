# Maintainer: Chris Howey <chris@howey.me> -> also the program developer

pkgname=ledger-go
_pkgname=${pkgname%-go}
pkgver=0.3.3
pkgrel=1
pkgdesc="A double-entry accounting system with a command-line reporting interface"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/howeyc/ledger"
license=(ISC)
depends=(glibc)
makedepends=(go)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e831e36d9ed9c334c4532836dea2a951e1b519b7a3e02755574a849431831bfe')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  CGO_ENABLED=0

  go build \
	-o ledger-go \
    -trimpath \
    -buildmode=pie \
    ./ledger
}

package() {
  install -Dm755 "${srcdir}"/${_pkgname}-${pkgver}/ledger-go "${pkgdir}"/usr/bin/ledger
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/man/ledger.1 "${pkgdir}/usr/share/man/man1/ledger.1"

  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/cmd/web-portfolio-sample.toml "${pkgdir}/usr/share/${_pkgname}/web-portfolio-sample.toml"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/cmd/web-quickview-sample.toml "${pkgdir}/usr/share/${_pkgname}/web-quickview-sample.toml"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/cmd/web-reports-sample.toml "${pkgdir}/usr/share/${_pkgname}/web-reports-sample.toml"
}
