# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_app_id="com.github.tallero.DialAPirate"
pkgname=dial-a-pirate
pkgver=0.0.1
_commit="32b7c6b"
pkgrel=3
pkgdesc="A LÖVE implementation of Dial-A-Pirate from the EGA version of The Secret of Monkey Island"
arch=('i686' 'x86_64')
url="https://github.com/tallero/dial-a-pirate"
license=('AGPL3')
depends=('love')
makedepends=('git' 'wget')
options=(!strip)
source=("${pkgname}::git+$url#commit=${_commit}"
        "${pkgname}.sh"
        "${_app_id}.desktop"
        "${_app_id}.png")
sha512sums=(SKIP
            "18ed8c35ae97402b0b5b10630f7e9a477015200a6447fd6a45cab7e580d781381beb2b1c6bb8e2c893ddb6b0142ecec58b24831e75a0501f8ab3e3f5132b6e45"
            "3aba506f26279f439d37a1105e3ac10ea63d69a5c184f9a41bff425421bd4a9a65a7c17952f17369fe9b908ea5924fdeaf5dbf6eef2be285d96b49d03d991be2"
            "b1c111f49ef594e06a3882a517a4cdc7314b5a8472989d694099e0313b0041643071ce5c461bba23c5837cc57aaeec6e641e5df4aabb69eb03b667a7a060d8cf")

build() {
  cd "${srcdir}/${pkgname}/assets"
  ./download-assets.sh
  cd ..
  ./build.sh
}

package() {
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -D -m0755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m0644 "${srcdir}/${pkgname}/${pkgname}.love" "${pkgdir}/usr/share/${pkgname}/${pkgname}.love"
}

# vim:set ts=2 sw=2 et:
