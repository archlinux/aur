# Maintainer: Serge K <arch@phnx47.net>

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgdesc='Task runner and repo management tool for the web ecosystem'
pkgver=1.31.2
pkgrel=1
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
sha256sums_x86_64=('6306d099a3ef3cd0a60b93d9b7efb5c7ecf767c867ad859ae71786033f4667f3')
sha256sums_aarch64=('96d37a86d9ffa9ea232236828359ab7710abc3f69148f9e5dfab1a0970fa5094')

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
