# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.84.0
pkgrel=1
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
optdepends=('sqlite: RPM support')

_release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
_ext=".tar.gz"

source_x86_64+=("${_release_url}-x86_64${_ext}")
source_aarch64+=("${_release_url}-aarch64${_ext}")
source_armv7h+=("${_release_url}-armv7h${_ext}")

sha256sums_x86_64=("c5b9747f3e7bb20443813002cb8ce69ae396aec5d088d0b27d61d11fadd0e0e9")
sha256sums_aarch64=("82db0bda75f36f64e7c6c5cfbcde1735c5e2e3a09ed715ebdc522466489d03fa")
sha256sums_armv7h=("13e660dddaa85134bfb9a281ada7bd4510e65a0ed6ed4f3f0bdbcb84879e9d90")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"

  install -Dm644 "update-qp-cache.hook" \
    "$pkgdir/usr/share/libalpm/hooks/update-qp-cache.hook"
}
