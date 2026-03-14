# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="localai"
_pkgname="local-ai"
pkgname="${_pkgname}-bin"
pkgver=4.0.0
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=(
  'aarch64'
  'x86_64'
)
url="https://localai.io"
_url="https://github.com/mudler/LocalAI"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
backup=(
  "etc/${_pkgname}/${_pkgname}.conf"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgname}."{conf,service,sysusers,tmpfiles}
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64"
)
sha256sums=('8153bc015f138655e08a49183c36d00f7fb661a2b9367110f44af844eab815ae'
            '6e4c0e2a2694867a5c27e21855e530a9327ae3658dbaa9b18fe028ab96df915a'
            '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
            'dd51cf954b60d75e0521a6e58188bcb06981e87d7ca8ac22d7dc4d46a362a671'
            '2074c84668d96c65e0f0f1508280a67c762f73feab26c762259996e6a23ed1a6'
            '56bef7ba54ae4e4477b9effe34b6e6cadc1b0bcfaacc5be503096a1ce0a9d391')
sha256sums_aarch64=('b3ca5093e57613ca2ee090e485a1c232a9e47ff32519803a1ef5ada18f357db2')
sha256sums_x86_64=('618e995b658f76f6aa7383ce8160e50775dc2887e8d3970d44338a0229d2e954')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_pkgname}.conf"     "${pkgdir}/etc/${_pkgname}/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

  install -vd "${pkgdir}/usr/share/${_name}/backends"
}
