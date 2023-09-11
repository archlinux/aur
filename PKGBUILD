# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgdesc='A multi-language version and dependency manager'
pkgver=0.17.0
pkgrel=1
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[0]}-unknown-linux-gnu.tar.xz")
sha256sums=('caad8b8fac54bf884c65d92e76de1fceb9a4ce180bea1a349f515b1ad473e6a4')

build() {
  cd "proto_cli-${CARCH}-unknown-linux-gnu"
  ./"${_pkgname}" completions --shell bash >"${_pkgname}-completion.bash"
  ./"${_pkgname}" completions --shell zsh >"${_pkgname}-completion.zsh"
  ./"${_pkgname}" completions --shell fish >"${_pkgname}.fish"
}

package() {
  cd "proto_cli-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # completions
  # bash
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm644 "${_pkgname}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  # zsh
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm644 "${_pkgname}-completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  # fish
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
