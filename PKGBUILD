# Maintainer: <max at swk-web.com>

_pkgname=php-mago
pkgname=${_pkgname}-bin
_pkgver=1.47.1
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Mago is a toolchain for PHP that aims to provide a set of tools to help developers write better code"
arch=('x86_64' 'aarch64')
url='https://github.com/carthage-software/mago'
license=('MIT')
source=("https://github.com/carthage-software/mago/releases/download/${_pkgver}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu"
  ./mago generate-completions bash > mago.bash
  ./mago generate-completions zsh > mago.zsh
  ./mago generate-completions fish > mago.fish
}

package() {
  install -D -m 644 "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu/mago" "${pkgdir}/usr/bin/mago"

  install -Dm644 "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu/mago.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/mago"
  install -Dm644 "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu/mago.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_mago"
  install -Dm644 "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu/mago.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/mago.fish"
}
