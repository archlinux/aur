# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.29.0
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go. Replaces yaylog."
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")

_release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
_ext=".tar.gz"

source_x86_64+=("${_release_url}-x86_64${_ext}")
source_aarch64+=("${_release_url}-aarch64${_ext}")
source_armv7h+=("${_release_url}-armv7h${_ext}")

sha256sums_x86_64=("478346b9b4e01117b353a07103ebe412b373c56b76fcf7fb37bcfc86e72f9786")
sha256sums_aarch64=("8572d3603cdd9da16f77c714f6bc6ec36ced3f4f14ced6ab30fe1ce28a37176a")
sha256sums_armv7h=("7d736044d651193d532dc0bda56081db215bb0e330a8b4987939eac84eca31ed")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
