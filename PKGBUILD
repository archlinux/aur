# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.3.33
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
sha256sums_aarch64=('2c60987f64f5e5251d8226b056c0fb8323bc36438bc29a2e4b2d9e5a18d4e09e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('4782724c0e633b77eed61a8b2e37c931522477932518610aa8039d656ee89d7d')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/lib/kilo/kilo"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/kilo/tree-sitter"
  cp -r ./tree-sitter/. "${pkgdir}/usr/lib/kilo/tree-sitter/"
  printf '%s\n' '#!/bin/sh' 'export KILO_TREE_SITTER_WASM_DIR=/usr/lib/kilo/tree-sitter' 'exec /usr/lib/kilo/kilo "$@"' > "${pkgdir}/usr/bin/kilo"
  chmod 755 "${pkgdir}/usr/bin/kilo"
}
