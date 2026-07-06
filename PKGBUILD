# Maintainer: Serge K <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgver=2.4.1
pkgrel=1
pkgdesc='Task runner and repo management tool for the web ecosystem'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/moon'
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.xz::${url}/releases/download/v${pkgver}/moon_cli-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.xz::${url}/releases/download/v${pkgver}/moon_cli-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('c4ad898ec024f5cc952000b3655d87ec266bb5c1429ee25f16fc0ee0313453c2')
sha256sums_aarch64=('46f6a60edbff5e80bcbb50f7058e63a00760103388b8f79c4fa364ef6ac36793')

prepare() {
  cd "moon_cli-${CARCH}-unknown-linux-gnu"

  mkdir -p completions
  "./${_pkgname}" completions --shell bash >"completions/bash"
  "./${_pkgname}" completions --shell zsh >"completions/zsh"
  "./${_pkgname}" completions --shell fish >"completions/fish"
}

package() {
   cd "moon_cli-${CARCH}-unknown-linux-gnu"

  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "${_pkgname}x" -t "${pkgdir}/usr/bin"

  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
