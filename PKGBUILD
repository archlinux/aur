# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="local-ai"
pkgname="${_pkgname}-bin"
pkgver=3.3.2
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('aarch64' 'x86_64')
url="https://localai.io"
_url="https://github.com/mudler/LocalAI"
license=('MIT')
# makedepends=('upx')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}."{conf,service,sysusers,tmpfiles}
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64")
noextract=("${source_aarch64[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums=('ad8459c708f6e4413d4d2d0c5dda71dc9a13860c1a8641d72f49cf9cf259768e'
            'bd420ec530cbfdb7f29b309e3c0c8cd72de6346b7c8e9882e917a071c65b344c'
            '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
            '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
            'e9d374818e185ec07eac1d378c2e6b2830cec1b8fefa3c38074bbe9433785309'
            '56bef7ba54ae4e4477b9effe34b6e6cadc1b0bcfaacc5be503096a1ce0a9d391')
sha256sums_aarch64=('40ea15ca8788566f10a857552f668e4aec5259763e1772c3876d60f947cd6a21')
sha256sums_x86_64=('293e128009ec31dfe002a2e8aa968ecb86f76b31677f4d699212a5968dacbaa5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_pkgname}.conf"     "${pkgdir}/etc/${_pkgname}/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

  # upx "${pkgdir}/usr/bin/${_pkgname}"
}
