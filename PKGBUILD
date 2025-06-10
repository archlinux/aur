# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="local-ai"
pkgname="${_pkgname}-bin"
pkgver=2.29.0
pkgrel=2
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('aarch64' 'x86_64')
url="https://localai.io"
_url="https://github.com/mudler/LocalAI"
license=('MIT')
depends_x86_64=('glibc')
# makedepends=('upx')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}."{conf,service,sysusers,tmpfiles}
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-Linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-Linux-x86_64")
noextract=("${source_aarch64[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums=('8e530e32d96d02c01192c987e8bffaf0bb67db34bf999fccdfa8d0777789233b'
            'bd420ec530cbfdb7f29b309e3c0c8cd72de6346b7c8e9882e917a071c65b344c'
            '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
            '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
            '213af40972cf692e5bfc12e16db38f25437d90b9cb1c7872bba7d1786fabc704'
            '56bef7ba54ae4e4477b9effe34b6e6cadc1b0bcfaacc5be503096a1ce0a9d391')
sha256sums_aarch64=('c8cb345061bb58b587ecec26fa88e54d72cdd56dda98b939fe27e465caf466f0')
sha256sums_x86_64=('a0710a5e05b477fe193f58e076e1049f8b4a94ddc9838ef1977730b4754e46d7')

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
