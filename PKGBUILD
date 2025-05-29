# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.66.0
pkgrel=1
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
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

sha256sums_x86_64=("6f15c50ec386c7f074eb52b56aeec89749a4cee0288d3eaa627acee05b3e0b59")
sha256sums_aarch64=("2f8be8b160a89c46c4148156548c6ab0fb10ab6725d7b32bda848a39cb8641ed")
sha256sums_armv7h=("41673c42eb02e5180804236ac6014031decbb057ff8fa8f89dc346b1288a5eb3")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"

  install -Dm644 "update-qp-cache.hook" \
    "$pkgdir/usr/share/libalpm/hooks/update-qp-cache.hook"
  install -Dm755 "update-qp-cache" \
    "$pkgdir/usr/share/libalpm/scripts/update-qp-cache"
}
