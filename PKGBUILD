# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_projname=wstunnel
_pkgname=haskell-"${_projname}"
pkgname="${_pkgname}"-bin
pkgver=3.0
pkgrel=2
pkgdesc="Tunneling over websocket protocol"
arch=('x86_64' 'i686' 'armv7l' 'aarch64')
url="https://github.com/erebe/wstunnel"
license=('BSD')
depends_i686=('gmp' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'nodejs-wstunnel')
source=("${pkgname}-${pkgver}-LICENSE::https://github.com/erebe/${_projname}/raw/v${pkgver}/LICENSE"
        "${pkgname}-${pkgver}-README.md::https://github.com/erebe/${_projname}/raw/v${pkgver}/README.md"
        "${pkgname}-${pkgver}-logo.png::https://github.com/erebe/${_projname}/raw/v${pkgver}/logo_${_projname}.png")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-x64-linux.zip")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-x86-linux-ubuntu18.tar.gz")
source_armv7l=("${pkgname}-${pkgver}-armv7l.tar.gz::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-armv7l-raspbian-buster.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-aarch64-ubuntu18.tar.gz")
sha256sums=('eaea4f8a2ebca92e3ca13f77d01364b110723c70ed6370ce1ecdb4f84261d411'
            'c408ac4b73b05052357f6a598b961f9fb73ddc29df296febdf06842ceaaa6422'
            'e193de98502986dfb54639058b1409e92282f78b54d04b0d2735d4b4c9be2b77')
sha256sums_x86_64=('040b3d6d98b8d3ff0df2ba05b6b89e8a6820be981ffe4a3b39af563225f66098')
sha256sums_i686=('1818b9862a1ba9e2f9594ecdd71045d375900c827ea33132a7bebc83610eff68')
sha256sums_armv7l=('d010c323a0c443da0a8190e8fc74c4c0de8580fb718adf3cc6e0dc2eeb96093c')
sha256sums_aarch64=('ebdc2d80d610aca00a122e12da089b7c6b2204112615594321754a543c68810c')

prepare() {
  sed -i "s|https://github.com/erebe/${_projname}/raw/master/logo_${_projname}.png|logo.png|g" "${pkgname}-${pkgver}-README.md"
}

package() {
  case "$CARCH" in
    aarch64) _executable_name="${_projname}-aarch64-ubuntu18" ;;
          *) _executable_name="${_projname}"                  ;;
  esac
  install -Dm755 "${_executable_name}" "${pkgdir}/usr/bin/${_projname}"
  unset _executable_name

  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}-logo.png" "${pkgdir}/usr/share/doc/${_pkgname}/logo.png"
}
