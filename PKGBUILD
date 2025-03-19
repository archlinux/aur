# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gopher64"
pkgname="${_pkgname}-bin"
pkgver=1.0.13
pkgrel=1
pkgdesc="N64 emulator written in Rust"
arch=('aarch64' 'x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('gendesk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.png::${url}/raw/refs/tags/v${pkgver}/data/${_pkgname}.png"
        "${_pkgsrc}.svg::${url}/raw/refs/tags/v${pkgver}/data/${_pkgname}.svg")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64")
b2sums=('0a6b6a370b918333c472dc8882d904b9f65b715d72fe5a829fa54d3888f2b14e71d7da0c1281ae44ded6dc64d2a90d7959d53eee1af1910a7f30a65525e95a39'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'aca4b3ddb63e2c137526300e6feae105f763815c6ab4b25975645f82a49923808af36541dfe4b4ef83150354a4298dd83911dc3030e3fafbcc0c6ace5424e24d'
        '6f96cb22ad57098056855f48f2fc7e510a85947562a153fd8b6750f30e013ac2eac4a5cca602b72e3d43b70c711f187ed71953fdb5002d31d8b25387d2ab125e')
b2sums_aarch64=('29f41bede9519affabbbf29c11c911f6722b3ccb5b30a09d11341f7112f45a54318e1e3f72080bd9b7a1f824218fb895a555f93f9b6a7e34d8a5c9d165de32ba')
b2sums_x86_64=('f864c55257950b7c85319316beec5e7f4ed901ce3d97da2fddd9b7050d8d1fc8788a30ffbef3c2826a5f72dd747f0eaf7b9a931bb8290ef101f8464cb9dc1b50')

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --name "${_pkgname}" \
    --exec "${_pkgname}" \
    --icon "${_pkgname}" \
    --comment "${pkgdesc}" \
    --categories "Game;Emulator" \
    "${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.png"       "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -vDm644 "${_pkgsrc}.svg"       "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -vDm644 "${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
