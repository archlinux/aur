# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgdesc='Task runner and repo management tool for the web ecosystem'
pkgver=1.17.4
pkgrel=1
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/moon'
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
source=("LICENSE::https://raw.githubusercontent.com/moonrepo/moon/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.bin::${url}/releases/download/v${pkgver}/moon-${arch[0]}-unknown-linux-gnu")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.bin::${url}/releases/download/v${pkgver}/moon-${arch[1]}-unknown-linux-gnu")
sha256sums=('d2ac84cff76ea43a70d2be1ba690fc03d51a9be8e8fc18281a229ddc5845e4a5')
sha256sums_x86_64=('37c3e866b05841d587e1abdc5f925fac2a66b000482dcf2bcdbe7ee923bd5308')
sha256sums_aarch64=('6742e9f7e9ed380f0d921d7fe945d3e80a09a04db94c761e842713842f75efbd')

prepare() {
  mkdir -p completions
  chmod +x "${_pkgname}-${pkgver}-${CARCH}.bin"
  "./${_pkgname}-${pkgver}-${CARCH}.bin" completions --shell bash >"completions/bash"
  "./${_pkgname}-${pkgver}-${CARCH}.bin" completions --shell zsh >"completions/zsh"
  "./${_pkgname}-${pkgver}-${CARCH}.bin" completions --shell fish >"completions/fish"
}

package() {
  install -Dm 755 "${_pkgname}-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
