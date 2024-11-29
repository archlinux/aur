# Maintainer: Serge K <arch@phnx47.net>

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgdesc='Task runner and repo management tool for the web ecosystem'
pkgver=1.30.2
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
sha256sums_x86_64=('04af6be9724474aad7d9b5cc8391aede6d83fb51e0e0210e924036c157c2e7eb')
sha256sums_aarch64=('8a3b7b169e17f86de84b2054f835d609d7a31fc278ce08f8691cc3203c5d6772')

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
