# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.50.0
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

sha256sums_x86_64=("7dc26edc447fed36122b7c92fab40187f5a712c5f54e5f626b2e2761411a08e7")
sha256sums_aarch64=("241477e57be7a62aacd924de68dc59b87a415d0b581b8cb218456c0f6f8e24b9")
sha256sums_armv7h=("1c0db90939c1a269fcc7ee326e0ccfae5371f5b101b46353d922835ab3d85cdf")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
