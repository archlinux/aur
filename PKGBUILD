# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_projname=wstunnel
_pkgname=haskell-"${_projname}"
pkgname="${_pkgname}"-bin
pkgver=3.1
pkgrel=1
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
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-x64-linux")
source_armv7l=("${pkgname}-${pkgver}-armv7l.zip::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-armv7l-linux.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/erebe/${_projname}/releases/download/v${pkgver}/${_projname}-aarch64-linux.zip")
sha256sums=('eaea4f8a2ebca92e3ca13f77d01364b110723c70ed6370ce1ecdb4f84261d411'
            '341a52f78b0a7af437a674650805bd8d0e1ee038854e2c50e91be8bd00e9168b'
            'e193de98502986dfb54639058b1409e92282f78b54d04b0d2735d4b4c9be2b77')
sha256sums_x86_64=('d22edd6dc10a971e77c46a09c512077a71a16abaede8a50a0d6a7afb3b36d69b')
sha256sums_armv7l=('e48f7ad7233165c47769665cf001acf97d5460f3b77417e9b37dae70b30cd6a6')
sha256sums_aarch64=('e6c9569a1f94dfd2ec71ddc03cca2eeed6e9b23fbf4ef8fcf3b06ef7e29f007d')

prepare() {
  sed -i "s|https://github.com/erebe/${_projname}/raw/master/logo_${_projname}.png|logo.png|g" "${pkgname}-${pkgver}-README.md"
}

package() {
  local _executable_name
  case "$CARCH" in
    x86_64) _executable_name="${pkgname}-${pkgver}-${CARCH}" ;;
         *) _executable_name="${_projname}/${_projname}"     ;;
  esac
  install -Dm755 "${_executable_name}" "${pkgdir}/usr/bin/${_projname}"

  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}-logo.png" "${pkgdir}/usr/share/doc/${_pkgname}/logo.png"
}
