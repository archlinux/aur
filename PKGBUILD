# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.94.0
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

sha256sums_x86_64=("d5d598fbdd7969bb45aaba0013f4b66c5e24666605494a70e47e3cac9abdc427")
sha256sums_aarch64=("c9c934d88926b8410f4b2f8cc81f56b471b1f5807748d895137bcf083b77d2a4")
sha256sums_armv7h=("3c208b031c8771f0de9598245de9d3a409e20fce323b80e8fb22344f72881e8b")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"

  install -Dm644 "update-qp-cache.hook" \
    "$pkgdir/usr/share/libalpm/hooks/update-qp-cache.hook"
}
