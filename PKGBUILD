# Maintainer: Polina Simonenko <rabarbrablad at gmail dot com>
_pkgname=exex
pkgname=${_pkgname}-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Terminal UI for exploring ELF, Mach-O and PE binaries"
arch=(x86_64 aarch64)
url="https://github.com/shellcell/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)

# Full build (Chroma syntax highlighting), not the -lite archive.
_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-amd64.tar.gz::${_base}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-arm64.tar.gz::${_base}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('80c60feed69a24edc9eed34d7f1b0a56cd893789c85972686b3e21f2b56d058a')
sha256sums_aarch64=('897337eed7b20beac91dbb3f5eb404b7779b8873cab6406df585b16ec20b033f')

package() {
  local _goarch=amd64
  [[ $CARCH == aarch64 ]] && _goarch=arm64
  cd "${_pkgname}-v${pkgver}-linux-${_goarch}"

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "man/man1/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 config.example.yaml -t "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 "completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
