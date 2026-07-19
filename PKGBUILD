# Maintainer: Polina Simonenko <rabarbrablad at gmail dot com>
_pkgname=ttysvg
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Record terminal sessions as animated SVG"
arch=(x86_64 aarch64)
url="https://github.com/shellcell/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)

_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-amd64.tar.gz::${_base}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-arm64.tar.gz::${_base}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('879c0e74357fc71673c7aa99570a41731d81d44d8b3476d93a3d23bd2716bd1f')
sha256sums_aarch64=('83ec4c913e2339efdc7d02034be360cbbe46b4794678533c0d15b545152beebe')

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
