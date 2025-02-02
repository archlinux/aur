# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="powder"
_pkgname="powder-toy"
pkgname="${_pkgname}-bin"
pkgver=99.2.382
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
b2sums=('df98cf7cbf0951e6f53ccaa558e1ff886e9aa4cd7cca6823e547bc7576a736e81f2acdf7b4f6133575bb7d1b0fdbb6804c2b6fbacd9c305ae52d38bb49b42596'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        '48e7b8e545a64a9f9ea676c67e038cece255434cbb4dea971d79472d79a9355184a31d856c1209d4dd5f45d4074fd90af61f9bb1a802fa30890056f75fe58d4c'
        'de800ad5a4bbff59d0e9befbb2d69e5c7228e2de7cd3de9fb188adb63c3d2799e48115cc60a67fa64bb27c3bc59753ee191cf56da62a65651811d731defef1ab'
        'd3162f81bfb927a9879c5629369ba8f13a45ba4fa8cfad78c5c40f6942de6b432e4eccacd156c792da7bf65ddf04292211d0c34f4db1cd51dba6765fde0ff917'
        'f522a3367e2b6a6dd9f534caf317ea54c39ce9867ad2e1a70f2c087c1842fc75d4d5797fe4bc3972e2950036da80cfcf61b7fbf82e225f615db5a19bed504098'
        'e4195bfdb9558260c2b1972780d66ee524463c75cccd010969671dfc291442923ff266cfabe76ceed1b4eed64c042c402c698941051fb628e399aaf0cf0655e7'
        'bcc78f20ceebc444d5da04b75f2d9225559d27d4d27398898cb2a71abf56a77af39af0cc041c8a302ad872a63c3fa4c366726adc9e3de589b361b98a36ac7c6a')
b2sums_aarch64=('f2609ae53826bdcf58e4f024f088ecf32a6fde996f5d5bf2fb2b6334587e042027213a9d70759483a5351482b8cd6eb085fe458b0bf03a1c6ed1fabe5b2145c4')
b2sums_x86_64=('801b6063f5b6185b4985352964c735684566a368f2308be96548fa8fefbaa211bd9c3cf951e7aa305f5f7496ba58284f9137a211b5ed23add7018170a1d2afd6')

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

  find "${pkgdir}/usr/share" -type f -exec \
    sed -e "s/@APPNAME@/${_appstrings[APPNAME]}/g" \
        -e "s/@APPCOMMENT@/${_appstrings[APPCOMMENT]}/g" \
        -e "s/@APPEXE@/${_appstrings[APPEXE]}/g" \
        -e "s/@APPID@/${_appstrings[APPID]}/g" \
        -e "s/@APPDATA@/${_appstrings[APPDATA]}/g" \
        -e "s/@APPVENDOR@/${_appstrings[APPVENDOR]}/g" \
        -e "s/@MANIFEST_DATE@/${_appstrings[MANIFEST_DATE]}/g" \
        -e "s/@DISPLAY_VERSION_MAJOR@/${_appstrings[DISPLAY_VERSION_MAJOR]}/g" \
        -e "s/@DISPLAY_VERSION_MINOR@/${_appstrings[DISPLAY_VERSION_MINOR]}/g" \
        -e "s/@BUILD_NUM@/${_appstrings[BUILD_NUM]}/g" \
        -i "{}" +
}
