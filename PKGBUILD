# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gmd"
_pkgname="gomanagedocker"
pkgname="${_pkgname}-bin"
pkgver=1.4
pkgrel=1
pkgdesc="A TUI tool to manage docker objects"
arch=('x86_64')
url="https://github.com/ajayd-san/${_pkgname}"
license=('MIT')
depends=('docker' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_v${pkgver}.tar.gz")
sha256sums=('b222e09ad10e03590d3fc21576a80ec31dfa21f63ec281b76b56501d94d6e69a'
            'fe87fdeb2a8066e6ad9a6c10c251a898b20139894a01f6ea8470aee593669858')
sha256sums_x86_64=('6a5914cb03d434f40a63ed33747c37f561b9fb7f4a001b40d339472749badbcf')

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
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "linux_${_arch}_v${pkgver}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
