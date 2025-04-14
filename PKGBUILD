# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp
pkgver=4.15.1
pkgrel=2
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go. Replaces yaylog."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1")
conflicts=("qp-bin" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
validpgpkeys=("4B9765E9DBCCEC2A")
source=(
  "${url}/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz"
  "https://github.com/Zweih/query-packages-signatures/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz.asc"
)
sha256sums=("132e38ed6ccd42516d63ed5a0ce732306c693116abd22270b69b44fe39027a99" "SKIP")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  export CGO_ENABLED=0
  go build -trimpath -o "${pkgname}" ./cmd/${pkgname}
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 "NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
