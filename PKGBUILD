# Maintainer: Serge K <arch@phnx47.net>

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgver=1.41.6
pkgrel=1
pkgdesc='Task runner and repo management tool for the web ecosystem'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/moon'
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/moonrepo/moon/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.bin::${url}/releases/download/v${pkgver}/moon-${arch[0]}-unknown-linux-gnu")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.bin::${url}/releases/download/v${pkgver}/moon-${arch[1]}-unknown-linux-gnu")
sha256sums=('d2ac84cff76ea43a70d2be1ba690fc03d51a9be8e8fc18281a229ddc5845e4a5')
sha256sums_x86_64=('294f2378b43e1b7244f575ac3ef88ecbb0182515cef77952119bd0a7b8aef64f')
sha256sums_aarch64=('3568f465f10a56eab5e1528cbeb3cba251c2bfbb3cf7ef03190529c90295a14d')

prepare() {
  chmod +x "${_pkgname}-${pkgver}-${CARCH}.bin"

  mkdir -p completions
  "./${_pkgname}-${pkgver}-${CARCH}.bin" completions --shell bash >"completions/bash"
  "./${_pkgname}-${pkgver}-${CARCH}.bin" completions --shell zsh >"completions/zsh"
  "./${_pkgname}-${pkgver}-${CARCH}.bin" completions --shell fish >"completions/fish"
}

package() {
  install -Dm 755 "${_pkgname}-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 "LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
