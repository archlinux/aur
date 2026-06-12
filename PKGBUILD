# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.3.45
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
sha256sums_aarch64=('175a66995fe9fa52da57936ab14099ccb97cc0769627ba0236d4413c6b41b3f6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('13cb2e526e01040842afd0a7c1b04bbbcb67fc8913e85e06d8d3f5295e8c9843')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/lib/kilo/kilo"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/kilo/tree-sitter"
  cp -r ./tree-sitter/. "${pkgdir}/usr/lib/kilo/tree-sitter/"
  printf '%s\n' '#!/bin/sh' 'export KILO_TREE_SITTER_WASM_DIR=/usr/lib/kilo/tree-sitter' 'exec /usr/lib/kilo/kilo "$@"' > "${pkgdir}/usr/bin/kilo"
  chmod 755 "${pkgdir}/usr/bin/kilo"
}
