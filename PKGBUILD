# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gopher64"
pkgname="${_pkgname}-bin"
pkgver=1.0.17
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
b2sums=('7c53d5cb7b3b5f2243253798469d7de56280f6b28b8d21ef68ec557b8ab572b7c2ec5669cd8a0f3e69493cf5b0770f49ee6aa5bf42f3801953b093b9e9902c81'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'aca4b3ddb63e2c137526300e6feae105f763815c6ab4b25975645f82a49923808af36541dfe4b4ef83150354a4298dd83911dc3030e3fafbcc0c6ace5424e24d'
        '6f96cb22ad57098056855f48f2fc7e510a85947562a153fd8b6750f30e013ac2eac4a5cca602b72e3d43b70c711f187ed71953fdb5002d31d8b25387d2ab125e')
b2sums_aarch64=('b9ef48b99f404cda982df98e762455775aa6e61156827958e3a0d75ccdb3ca10d2e0ecd122dc1d2b657d4019398cd808795dc9b834c125db57a45ad77597f659')
b2sums_x86_64=('9c9ccae3df97332872f30db322fba04bb4667cbf605d61839f70d3971a8676e7a897a2ea183f39b5cc21ddf3de3ffad95f87f31fa4652f66e35550966d8e939b')

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
