# Maintainer: Serge K <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgver=2.4.6
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
sha256sums_x86_64=('106a4b18ddd93e9485a396c14b3a7e287586a006ea201e6a0b37e9e221f51d97')
sha256sums_aarch64=('5eb8afeae1afca5a74efe8db9aafb1fc47ca5c10a0fe976b740f3ad45b3a5cae')

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
