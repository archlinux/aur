# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="phylum"
pkgname="${_pkgname}-bin"
pkgver=6.6.5
pkgrel=1
pkgdesc="Command line interface for the Phylum API"
arch=('x86_64' 'aarch64')
url="https://${_pkgname}.io/"
_url="https://github.com/${_pkgname}-dev/cli"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url}/raw/v${pkgver}/"{README.md,LICENSE})
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.zip")
sha256sums=('e25ab845c4018b67fe54c12a3a6b4e48e33e59e92baa5e69672909ba67e80c66'
            'bf7bed83defddbaf30ff7c1a7d24a803170064ed729aed1e9686095e8f1f5ca7')
sha256sums_x86_64=('8c751eaa4821e5fa14f8d72b6e6c268f4bc3f8a04fa7c61b523b97c02d44fbb3')
sha256sums_aarch64=('5f30ab97b35a47c6e44e38befb9fda5cc7af314cabb4c8cd07573889d971a27d')

package() {
  cd "${srcdir}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "completions"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
