# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="resto"
pkgname="${_pkgname}-bin"
pkgver=0.1.6
pkgrel=1
pkgdesc="Send pretty HTTP & API requests with TUI"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/abdfnx/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_amd64.zip")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_arm64.zip")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_386.zip")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_arm.zip")
sha256sums=('c27ee477f19d49faec9d5891c04ad290bca2269963eecc6e012e53f63d38f5ab')
sha256sums_x86_64=('727aec157821e6c5893e019407dcf0594959854d37effd0599db27adeb13ebec')
sha256sums_aarch64=('c6e6678335ca8863d740bdf439daca218f89ce06fac66cbc486ff93d2ce91610')
sha256sums_i686=('0edff92b7244c35c94269b7b5e2054a6dc553b5d1f1a95cb0757828c7ab8b936')
sha256sums_armv7h=('1fec4d3f0ee7c8c7b33517814f8293c9cbb133cbc3de84f2e8d6c130fadf8d38')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  i686)
    _arch="386"
    ;;
   aarch64)
    _arch="arm64"
    ;;
  armv7h)
    _arch="arm"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${_pkgname}_linux_v${pkgver}_${_arch}"
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
