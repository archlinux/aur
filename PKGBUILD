# Maintainer: Polina Simonenko <rabarbrablad at gmail dot com>
_pkgname=snailrace
pkgname=${_pkgname}-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Benchmark commands measuring time, CPU, memory and disk footprint"
arch=(x86_64 aarch64)
url="https://github.com/shellcell/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)

_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-amd64.tar.gz::${_base}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-arm64.tar.gz::${_base}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('28ea67c1849b697b87e444a606ba9e1d1a061259c51803d76882b9af8c165d00')
sha256sums_aarch64=('320b53fef4087f1b6749604b98a8f16f36655312cefef1db05eef4da9d34d8b5')

package() {
  local _goarch=amd64
  [[ $CARCH == aarch64 ]] && _goarch=arm64
  cd "${_pkgname}-v${pkgver}-linux-${_goarch}"

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "man/man1/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 "completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
