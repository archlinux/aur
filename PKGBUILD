# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp
pkgver=5.28.0
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go. Replaces yaylog."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1")
conflicts=("qp-bin" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
source=("${url}/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz")
sha256sums=("cb4eda1825236f0d9f78b9da42da9ce07b96e513a16b19a814fad7217536a6dc")

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
