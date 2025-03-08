# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gmd"
_pkgname="gomanagedocker"
pkgname="${_pkgname}-bin"
pkgver=1.5
pkgrel=2
pkgdesc="A TUI tool to manage docker objects"
arch=('x86_64')
url="https://github.com/ajayd-san/${_pkgname}"
license=('MIT')
depends=('docker' 'glibc' 'gpgme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_v${pkgver}.tar.gz")
sha256sums=('2db7135de1348fef00f3a984e2e946e28889e5f503e7a5ae12a12601291aedf4'
            'fe87fdeb2a8066e6ad9a6c10c251a898b20139894a01f6ea8470aee593669858')
sha256sums_x86_64=('36d8d15fcf84790dfd64f43714ddfed05c6459372327cef3e540b9f85145bafb')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    ;;
esac

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}_linux_${_arch}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
