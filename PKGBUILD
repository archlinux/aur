# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="powder"
_pkgname="powder-toy"
pkgname="${_pkgname}-bin"
pkgver=99.1.380
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!"
arch=('aarch64' 'x86_64')
url="https://powdertoy.co.uk"
_url="https://github.com/The-Powder-Toy/The-Powder-Toy"
license=('GPL-3.0-only')
depends=('glibc' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

declare -rAg _appstrings=(
  [APPNAME]="The Powder Toy"
  [APPCOMMENT]="Physics sandbox game"
  [APPEXE]="${_pkgname}"
  [APPID]="uk.co.powdertoy.tpt"
  [APPDATA]="The Powder Toy"
  [APPVENDOR]="powdertoy"
  [MANIFEST_DATE]=""
  [DISPLAY_VERSION_MAJOR]="${pkgver%%.*}"
  [DISPLAY_VERSION_MINOR]="$(echo "$pkgver" | sed 's/^[0-9]*\.\([0-9]*\).*/\1/')"
  [BUILD_NUM]="${pkgver##*.}"
)

_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_appstrings[APPID]}-${pkgver}.appdata.xml::${_url}/raw/refs/tags/v${pkgver}/resources/appdata.template.xml"
        "application-vnd.${_appstrings[APPVENDOR]}.save-${pkgver}.svg::${_url}/raw/refs/tags/v${pkgver}/resources/icon_cps.svg"
        "${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}-${pkgver}.svg::${_url}/raw/refs/tags/v${pkgver}/resources/icon_exe.svg"
        "${_appstrings[APPEXE]}-${pkgver}.man.6::${_url}/raw/refs/tags/v${pkgver}/resources/${_binname}.man"
        "${_appstrings[APPID]}-${pkgver}.desktop::${_url}/raw/refs/tags/v${pkgver}/resources/${_binname}.template.desktop"
        "${_appstrings[APPVENDOR]}-save-${pkgver}.xml::${_url}/raw/refs/tags/v${pkgver}/resources/save.xml")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_binname}-v${pkgver}-aarch64-linux-gnu")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_binname}-v${pkgver}-x86_64-linux-gnu")
b2sums=('be2c87fdd9d62d86e4336c1b455a27e9fe9adadb9d9cad991bbac4bf84f428bc239e5be7c8960de7b51bc5404d3364bf292b7c6076fd724afb156505365726a9'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        '48e7b8e545a64a9f9ea676c67e038cece255434cbb4dea971d79472d79a9355184a31d856c1209d4dd5f45d4074fd90af61f9bb1a802fa30890056f75fe58d4c'
        'de800ad5a4bbff59d0e9befbb2d69e5c7228e2de7cd3de9fb188adb63c3d2799e48115cc60a67fa64bb27c3bc59753ee191cf56da62a65651811d731defef1ab'
        'd3162f81bfb927a9879c5629369ba8f13a45ba4fa8cfad78c5c40f6942de6b432e4eccacd156c792da7bf65ddf04292211d0c34f4db1cd51dba6765fde0ff917'
        'f522a3367e2b6a6dd9f534caf317ea54c39ce9867ad2e1a70f2c087c1842fc75d4d5797fe4bc3972e2950036da80cfcf61b7fbf82e225f615db5a19bed504098'
        'e4195bfdb9558260c2b1972780d66ee524463c75cccd010969671dfc291442923ff266cfabe76ceed1b4eed64c042c402c698941051fb628e399aaf0cf0655e7'
        'bcc78f20ceebc444d5da04b75f2d9225559d27d4d27398898cb2a71abf56a77af39af0cc041c8a302ad872a63c3fa4c366726adc9e3de589b361b98a36ac7c6a')
b2sums_aarch64=('39f4f22632fba8890de1c4fa45a78895e7c3c72b8069586b3911a45433275c62fed54b6d321323dc7a83fc1dad2505c5d96dc59516e86ed86587fe1e21c6ff21')
b2sums_x86_64=('93078bac25555d4a113205055d1394183eccb844280cf456023d04cd8e8705b17a4a746e802d454a5721042de3fa6d8fb70a7e26d0942c07beec3bf2122076de')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_appstrings[APPID]}-${pkgver}.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/${_appstrings[APPID]}.appdata.xml"
  install -vDm644 "application-vnd.${_appstrings[APPVENDOR]}.save-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-vnd.${_appstrings[APPVENDOR]}.save.svg"
  install -vDm644 "${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.svg"
  install -vDm644 "${_appstrings[APPEXE]}-${pkgver}.man.6" \
    "${pkgdir}/usr/share/man/man6/${_appstrings[APPEXE]}.6"
  install -vDm644 "${_appstrings[APPID]}-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/${_appstrings[APPID]}.desktop"
  install -vDm644 "${_appstrings[APPVENDOR]}-save-${pkgver}.xml" \
    "${pkgdir}/usr/share/mime/packages/${_appstrings[APPVENDOR]}-save.xml"

  cd "${pkgdir}/usr/share"
  find . -type f -exec \
    sed -e "s/@APPNAME@/${_appstrings[APPNAME]}/g" \
        -e "s/@APPCOMMENT@/${_appstrings[APPCOMMENT]}/g" \
        -e "s/@APPEXE@/${_appstrings[APPEXE]}/g" \
        -e "s/@APPID@/${_appstrings[APPID]}/g" \
        -e "s/@APPDATA@/${_appstrings[APPDATA]}/g" \
        -e "s/@APPVENDOR@/${_appstrings[APPVENDOR]}/g" \
        -e "s/@MANIFEST_DATE@/${_appstrings[MANIFEST_DATE]}/g" \
        -e "s/@DISPLAY_VERSION_MAJOR@/${_appstrings[APPNAME]}/g" \
        -e "s/@DISPLAY_VERSION_MINOR@/${_appstrings[APPNAME]}/g" \
        -e "s/@BUILD_NUM@/${_appstrings[APPNAME]}/g" \
        -i "{}" +
}
