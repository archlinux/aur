# Maintainer: <max at swk-web.com>

_pkgname=php-mago
pkgname=${_pkgname}-bin
_pkgver=1.48.1
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Mago is a toolchain for PHP that aims to provide a set of tools to help developers write better code"
arch=('x86_64' 'aarch64')
url='https://github.com/carthage-software/mago'
license=('MIT')
source_x86_64=("https://github.com/carthage-software/mago/releases/download/${_pkgver}/mago-${_pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/carthage-software/mago/releases/download/${_pkgver}/mago-${_pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a82d45166ce945171cad650b9908f08bec1bd28d29e520d9080b4c962a1cfd62')
sha256sums_aarch64=('b91c8f15ebb18c80bf3559e112d7f0bd43e637603d5f586716ee12961fed8a8b')

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
