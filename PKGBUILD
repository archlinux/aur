# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.27.0
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

sha256sums_x86_64=("c026ae003ed52a7b498ce027243203026dcb2a919bb148cfac68236b02209eaf")
sha256sums_aarch64=("ebd201a02c172993d2f953bfe44e4cdaae3beced13525476a4288b0e4c9668ad")
sha256sums_armv7h=("f929416f3ac00e07b55480d94752ff7c14050bc95d2252ca3ceb12ed7140a346")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
