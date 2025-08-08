# Maintainer: Hidehico Oba <hidehico dot ooba at gmail dot com>

_pkgauthor=hidehic0
_pkgname=acc_utils
pkgname=${_pkgname}-bin
pkgver=0.0.5
pkgrel=0
pkgdesc="A tool with enhanced functionality using files created by atcoder-cli"
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('Unlicense')
arch=('x86_64')
depends=('bash')
# install=acc_utils.install
source=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums=('d237d2a0b999d208330dc050fc2824ed13fc62773cac66ea811f146b73ff7691')

build() {
  cd "${srcdir}/" || exit

  mkdir -p ./completions

  "./${_pkgname}" completion bash >./completions/bash
  "./${_pkgname}" completion zsh >./completions/zsh
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "./completions/bash" "${pkgdir}/usr/share/bash-completion/completions/acc_utils"
  install -Dm644 "./completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_acc_utils"
}
