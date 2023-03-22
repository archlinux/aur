# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
_projname=wstunnel
_pkgname=haskell-"${_projname}"
pkgname="${_pkgname}"-bin
pkgver=5.0
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
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-linux-aarch64.zip")
sha256sums=('eaea4f8a2ebca92e3ca13f77d01364b110723c70ed6370ce1ecdb4f84261d411'
            'fe741dbc74317e774f80e47cf532e2ad482360381b352ff4c0a58ff89541335a'
            'e193de98502986dfb54639058b1409e92282f78b54d04b0d2735d4b4c9be2b77')
sha256sums_x86_64=('7f55e2e138f430f799a0794f45cdad4619295492a4a88380af07050900a2d61b')
sha256sums_aarch64=('4b5308ac84b5852d45542c9f1e792a19bcc279aec08c2f5c1f702f3f097f3d12')

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
