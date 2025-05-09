# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DoomRunner"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.9.1
pkgrel=1
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/${_Name}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.ico::${url}/raw/refs/tags/v${pkgver}/Resources/${_Name}.ico"
        "${_pkgsrc}.desktop::${url}/raw/refs/tags/v${pkgver}/Install/XDG/${_Name}.desktop"
        "${_pkgsrc}-io.github.Youda008.${_Name}.appdata.xml::${url}/raw/refs/tags/v${pkgver}/Install/XDG/io.github.Youda008.${_Name}.appdata.xml")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_Name}-${pkgver}-Linux-64bit-dynamic.zip")
b2sums=('bf64b656497903ec5de2e6af29fd3168def7c488e4a1e23d501d75b98544fd9b627789e29ecd7a385a7dd92ec43e6bda171cbf120ee0007d4050bf3def8a8a89'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'd53d0abf51c8149b4a1f382dbd818b0fb8ae5268b93ab9c17c955b8dbfbd78bb76c9e29e368ba34b2b35fe0cb0a6c17cd647fbe6d258d2ad62ac45e5ff71beb7'
        'e636fca0bc4861cfbb7e3ec6e9ef4678c07b38a45558e0b6e69bb0686e5e28cbae1fb8231e094f53b8a55babfd2302028c7173630ca7dc72d8c315ae480a8eed'
        'fde45205eb87aad797e800af97c7cafd0621461204626faa79230b6c82888489b3794065302a9cca9d501a51a7dba2bf4b1e0cac9b2329f8828f72b5f6953f98'
        '3f3e0a6de3e49aad6e4f9897eb989533d554889ced382c2ea7a5eb594b0e123d45f446794667ce8f03e2f5da0bb9eea3bcc32c93c94a6dc0c41559b4720e0c0a'
        '00b055576c70101e457df1d0ebdbf078e601041e1c71c1a3fcfd91996b714aab1af29b2553a231ea0b4353d05f4f7234d8cff9558aca0f633b2ae3ef6a5dab2a'
        'dbb3bea2e4f4e87a4d8397e561866dfbd3ab00e2ad534dd0f9a10d591f3b73bc4ca0511caa0cbba5a005e0a1c1c83133298133541df1242828a39598de56159f'
        '04d257ab660ae2a83f688786b9bd21757e84b704f1c103d06e4a5c00f243466a489982cbbfa97416e0d8bf366ab561ff71cdd3c392a8eeb8c7d204eb8637301f'
        '6d2e064a45c54ccb80dff84a35b731c79d35524b00fb89ca28de50d9521fb00b703a88416466bf6f154edf41cc84447639990a4eb6684a8e625fe1166dc8a9d7'
        '39c2a676250632e2e006b894de3525e7dbd80fe81146fa6074ad34f562d9f600f7561d394c5e6f5300fba216a27ef9fca5fd58c4b9546a55dc99e9ad5d984663')
b2sums_x86_64=('387f410d0c58c9f5226d5133723cf58b78669c0795c46ade8a95ec9c2339a1e60ce6f9acc23734933bc631ab0c871cf83a548924f1f39419aafd2786206c2749')

declare -rg _icons="16 24 32 48 64 128"
for size in $_icons; do
  source+=("${_pkgsrc}.${size}x${size}.png::${url}/raw/refs/tags/v${pkgver}/Install/XDG/${_Name}.${size}x${size}.png")
done

package() {
  cd "${srcdir}"
  install -vDm755 "${_Name}" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.ico" "${pkgdir}/usr/share/pixmaps/${_Name}.ico"
  install -vDm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_Name}.desktop"
  install -vDm644 "${_pkgsrc}-io.github.Youda008.${_Name}.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.Youda008.${_Name}.appdata.xml"

  for size in $_icons; do
    install -vDm644 "${_pkgsrc}.${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_Name}.png"
  done
}
