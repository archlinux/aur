# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kestrel"
pkgname="${_pkgname}-bin"
pkgver=1.0.2
pkgrel=2
pkgdesc="File encryption done right"
arch=('x86_64' 'aarch64')
url="https://getkestrel.com"
_url="https://github.com/finfet/${_pkgname}"
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}-amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}-arm64.tar.gz")
sha256sums=('f765d5b753c97aeaff2a856dffa575962101bcdc813bc8811d78ccfc2f8fff07')
sha256sums_x86_64=('8ca35dc478042a6b81bfe2b3a8cdf5344b3d5bf34e73ac46fdd7598a3e7e652b')
sha256sums_aarch64=('02b979b5770b234cf7d2336bc0521f9a7e36409f67aab467726346a3dfc50eaa')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${_pkgname}-linux-v${pkgver}-${_arch}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "completion/${_pkgname}.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
