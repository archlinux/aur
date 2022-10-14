# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
_projname=wstunnel
_pkgname=haskell-"${_projname}"
pkgname="${_pkgname}"-bin
pkgver=4.1
pkgrel=1
pkgdesc="Tunneling over websocket protocol"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/erebe/wstunnel"
license=('BSD')
depends_i686=('gmp' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'nodejs-wstunnel')
source=("${pkgname}-${pkgver}-LICENSE::https://github.com/erebe/${_projname}/raw/v${pkgver}/LICENSE"
        "${pkgname}-${pkgver}-README.md::https://github.com/erebe/${_projname}/raw/v${pkgver}/README.md"
        "${pkgname}-${pkgver}-logo.png::https://github.com/erebe/${_projname}/raw/v${pkgver}/logo_${_projname}.png")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-x64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-aarch64-linux.zip")
sha256sums=('eaea4f8a2ebca92e3ca13f77d01364b110723c70ed6370ce1ecdb4f84261d411'
            '0c36b137a787f94d66a9abc9bbc240da0fb3ac3624bcc573a55df3dfe063ac6a'
            'e193de98502986dfb54639058b1409e92282f78b54d04b0d2735d4b4c9be2b77')
sha256sums_x86_64=('2c900b3390a439730449cf804d18020c43e9b2883d0c0f6ad3140c22f2a26d07')
sha256sums_aarch64=('a765f7ce669454fd4124b5cace7a240d9ead4e8c504cced4f7c486a3845a1239')

prepare() {
  sed -i "s|https://github.com/erebe/${_projname}/raw/master/logo_${_projname}.png|logo.png|g" "${pkgname}-${pkgver}-README.md"
}

package() {
  local _executable_name="${_projname}"
  case "$CARCH" in
    x86_64)
      _executable_name="${pkgname}-${pkgver}-${CARCH}" ;;
    aarch64)
      _executable_name="${_projname}_${CARCH}" ;;
  esac
  install -Dm755 "${_executable_name}" "${pkgdir}/usr/bin/${_projname}"

  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}-logo.png" "${pkgdir}/usr/share/doc/${_pkgname}/logo.png"
}
