# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>

_pkgname="RatioMaster.NET"
pkgname="ratiomaster.net-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="Fake the upload and download a BitTorrent tracker sees, without a client (prebuilt)"
url="https://github.com/NikolayIT/RatioMaster.NET"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libice'
  'libsm'
  'libx11'
)

source=(
  "LICENSE.upstream::https://raw.githubusercontent.com/NikolayIT/RatioMaster.NET/v${pkgver}/LICENSE"
)
sha256sums=('8b061698df912d3d7700fdd8a9ffb2b23e0c881bb41805394baf1790f47ad2dc')
sha256sums_x86_64=('a499241aedcffbb4258f9045c07bf03eff28a50fb691f3ba5624beff45d5ec71')
sha256sums_aarch64=('a26d43fd484020e26d68e7788dc1111bc60abcfcec40c27192727341d7ed7220')

source_x86_64=("${_pkgname}-linux-x64.tar.gz::https://github.com/NikolayIT/RatioMaster.NET/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz")
source_aarch64=("${_pkgname}-linux-arm64.tar.gz::https://github.com/NikolayIT/RatioMaster.NET/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")

package() {
  cd "${srcdir}"

  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  install -Dm644 "${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
  sed -i "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
  sed -i "s|^Icon=.*|Icon=ratiomaster|" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  install -Dm644 "${_pkgname}/ratiomaster.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ratiomaster.png"

  install -Dm644 "${srcdir}/LICENSE.upstream" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
