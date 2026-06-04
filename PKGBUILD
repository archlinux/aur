# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.3.31
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilocode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('05706441eaaa80d3d3a48f6787fe1c52b47663812b0d4bb8d69b917bd4757cfe')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('b497a0eeab2a26fd58da22ec9c80e4a40d4b25fdce6e94c19d06c187211334b9')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/lib/kilo/kilo"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/kilo/tree-sitter"
  cp -r ./tree-sitter/. "${pkgdir}/usr/lib/kilo/tree-sitter/"
  printf '%s\n' '#!/bin/sh' 'export KILO_TREE_SITTER_WASM_DIR=/usr/lib/kilo/tree-sitter' 'exec /usr/lib/kilo/kilo "$@"' > "${pkgdir}/usr/bin/kilo"
  chmod 755 "${pkgdir}/usr/bin/kilo"
}
