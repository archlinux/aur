# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_binname="gmd"
_pkgname="gomanagedocker"
pkgname="${_pkgname}-bin"
pkgver=1.2
pkgrel=1
pkgdesc="A TUI tool to manage docker objects"
arch=('x86_64')
url="https://github.com/ajayd-san/${_pkgname}"
license=('MIT')
depends=('glibc' 'docker')
provides=("${_binname}")
conflicts=("${_binname}")
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_v${pkgver}.tar.gz")
sha256sums=('96001f335fa20677bd7ba3d01164c4766aa3640fb6698a0f9625b99cc4ae61f0'
            'fe87fdeb2a8066e6ad9a6c10c251a898b20139894a01f6ea8470aee593669858')
sha256sums_x86_64=('9992038bacc84f049072fdb2347e5c68d948ad0a97880d3aa7e418eebe2dd65b')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"

  cd "linux_${_arch}_v${pkgver}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
