# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp
pkgver=5.2.1
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go. Replaces yaylog."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1")
conflicts=("qp-bin" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
source=("${url}/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz")
sha256sums=("f5063ef2a51a5b5847bbf3ad02023b0e4e17310b149790c4691957acf4f1dd73")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  export CGO_ENABLED=0

  if [[ -f .ldflags ]]; then
    ldflags=$(<.ldflags)
  fi

  go build -trimpath -ldflags "${ldflags}" -o "${pkgname}" ./cmd/${pkgname}
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 "NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
