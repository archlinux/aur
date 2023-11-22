# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgdesc='Task runner and repo management tool for the web ecosystem'
pkgver=1.17.3
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
sha256sums_x86_64=('306f8362de36520f7405718276831c9ab388f62d8737efcb39fe6e45191cb2d4')
sha256sums_aarch64=('e8e14a5b9d541ec1a281824bbf5690dee21539380ef27909fdc2c4b7c76fd463')

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
