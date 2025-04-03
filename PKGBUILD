# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=4.1.4
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=('yaylog' 'yaylog-bin' 'yaylog-git')

_release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
_ext=".tar.gz"

source_x86_64+=("${_release_url}-x86_64${_ext}")
source_aarch64+=("${_release_url}-aarch64${_ext}")
source_armv7h+=("${_release_url}-armv7h${_ext}")

sha256sums_x86_64=('79362137a9ee65c50d82baf9892cd0761d85eaa5c763ba9b10d6d27c337b1bbe')
sha256sums_aarch64=('10b8d8b0cddc4b84e18c15e303cac5ed7e131e88cf20193e36760d2c582b2c87')
sha256sums_armv7h=('4632a3667c94eb915fb72850a2c9e043e8a36fb848094ab20ca29b253e9b1b1e')

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "$pkgdir/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "$pkgdir/usr/share/doc/${pkgname}/NEWS"
}
