# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gopher64"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
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
b2sums=('24b547e6ebf321832413909537ffb9787ae8b02acc7031833b41b27933078e965ff4b312a4a3b65f7c4ed93d1881aa73bcf00fc2b30dfdd124cf5449a3d9da40'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'aca4b3ddb63e2c137526300e6feae105f763815c6ab4b25975645f82a49923808af36541dfe4b4ef83150354a4298dd83911dc3030e3fafbcc0c6ace5424e24d'
        '6f96cb22ad57098056855f48f2fc7e510a85947562a153fd8b6750f30e013ac2eac4a5cca602b72e3d43b70c711f187ed71953fdb5002d31d8b25387d2ab125e')
b2sums_aarch64=('2f4b6a26d1e43dd865eb40ef78952f5caeab03a9ca8b3a1f3ed79303ac1e3828becaa0d7326dba46a7d1b9cdb352b6b59ac424f1833d98e6364efa30a56c51dd')
b2sums_x86_64=('b8d66924734c51187953349261498c308cfdee9eeafeff1eb49e7c3c3a0bde459c725d0e51855134ea10d8b394f97b91404d5dd41c6241b9e280cbb2991cf7f9')

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
