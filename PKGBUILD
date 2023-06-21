# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_ns="tallero"
_pkg="DialAPirate"
_app_id="com.github.${_ns}.${_pkg}"
pkgname=dial-a-pirate
pkgver=0.0.1
pkgrel=3
_pkgdesc=("A LÖVE implementation of Dial-A-Pirate "
         "from the EGA version of The Secret of Monkey Island")
pkgdesc="${_pkgdesc[*]}"
arch=(
  'x86_64'
  'i686'
  'armv7h'
  'aarch64'
  'pentium4'
)
url="https://github.com/${_ns}/${pkgname}"
license=('AGPL3')
depends=('love')
makedepends=('wget')
options=(!strip)
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.sh"
  "${_app_id}.desktop"
  "${_app_id}.png")
sha512sums=(
  "5186dfc8fc400ac911766bfb62e471321221f2faf50ae843261bb1261215aebfeb09003e4b1f0ea4c0be7cf521f162e7c6687a74a14f1c90dbbdc80db0489b68"
  "18ed8c35ae97402b0b5b10630f7e9a477015200a6447fd6a45cab7e580d781381beb2b1c6bb8e2c893ddb6b0142ecec58b24831e75a0501f8ab3e3f5132b6e45"
  "3aba506f26279f439d37a1105e3ac10ea63d69a5c184f9a41bff425421bd4a9a65a7c17952f17369fe9b908ea5924fdeaf5dbf6eef2be285d96b49d03d991be2"
  "b1c111f49ef594e06a3882a517a4cdc7314b5a8472989d694099e0313b0041643071ce5c461bba23c5837cc57aaeec6e641e5df4aabb69eb03b667a7a060d8cf")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/assets"
  ./download-assets.sh
  cd ..
  ./build.sh
}

package() {
  install -Dm755 "${_app_id}.desktop" \
                 "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -Dm0755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.love" \
                  "${pkgdir}/usr/share/${pkgname}/${pkgname}.love"
}

# vim:set ts=2 sw=2 et:
