# Maintainer: <max at swk-web.com>

_pkgname=php-mago
pkgname=${_pkgname}-bin
pkgver=1.60.1
pkgrel=1
pkgdesc="Mago is a toolchain for PHP that aims to provide a set of tools to help developers write better code"
arch=('x86_64' 'aarch64')
url='https://github.com/carthage-software/mago'
license=('MIT')
source_x86_64=("https://github.com/carthage-software/mago/releases/download/${pkgver}/mago-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/carthage-software/mago/releases/download/${pkgver}/mago-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('00d2d230e879d406728d99eb41cdc45d6cdb9bb2bfdc52d063a06f18dce4909b')
sha256sums_aarch64=('7d613cbf59a28decfd96eba4ef9f6477568037ee66f83a381027b272f2b630bd')

build() {
  cd "${srcdir}/mago-${pkgver}-${CARCH}-unknown-linux-gnu"
  ./mago generate-completions bash > mago.bash
  ./mago generate-completions zsh > mago.zsh
  ./mago generate-completions fish > mago.fish
}

package() {
  install -D -m 644 "${srcdir}/mago-${pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/mago-${pkgver}-${CARCH}-unknown-linux-gnu/mago" "${pkgdir}/usr/bin/mago"

  install -Dm644 "${srcdir}/mago-${pkgver}-${CARCH}-unknown-linux-gnu/mago.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/mago"
  install -Dm644 "${srcdir}/mago-${pkgver}-${CARCH}-unknown-linux-gnu/mago.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_mago"
  install -Dm644 "${srcdir}/mago-${pkgver}-${CARCH}-unknown-linux-gnu/mago.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/mago.fish"
}
