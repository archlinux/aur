# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname='luna-translator'
pkgver='10.15.6.30'
pkgrel=1
pkgdesc='Visual Novel Translator'
arch=(x86_64)
url='https://lunatranslator.org/'
license=('GPL-3.0-only')
options=(!debug)

depends=('wine')
optdepends=('ollama: Use local translation model')

source=(
    "${pkgname}_${pkgver}.zip::https://github.com/HIllya51/LunaTranslator/releases/download/v${pkgver}/LunaTranslator_x64_win10.zip"
    'luna-translator'
    'LunaTranslator.desktop'
    'LunaTranslator.png'
)
b2sums=(
    '3d07e0faa79246e0db7e144da8e6e78b6388688f5ba624bec5e8e1deddb76ef8ec5cc96d3acb3a44d67ecfab5a518bcb4478ae3952c592028458974e3d7c052f'
    'a20f6d19721599fe3121ffd26c64a793729c5929b76c317bbc60c6ac9f4a5313330d581771abe0f07ffe1c29582f87444739117f6d5f08da7599bce73798cb13'
    '96791975a8d6ff19e0de383f92bfeba3e805ef482c803c07801ea70a67c59c0b5ff056c3dac4b6a56a48811abea83bc28760259aad5ee7f02e7051996f5eb42b'
    '631ab7da2757459c7da9a1ac335cf9d9c920facb8fc589ab135ef762083df73b982a3c5bc3fbe56036ff0bb27303e0961196726ee503730aa9095bae5a957ab2'
)

prepare() {
    cd 'LunaTranslator_x64_win10'
    rm -rf 'LICENSES' 'LunaTranslator_admin.exe' 'LunaTranslator_debug.bat'

    find . -type d -exec chmod 755 "{}" \;
    find . -type f -exec chmod 644 "{}" \;
}

package() {
    install -d -m755 "${pkgdir}/usr/share/${pkgname}"
    mv LunaTranslator_x64_win10/* "${pkgdir}/usr/share/${pkgname}"

    install -Dm755 luna-translator "${pkgdir}/usr/bin/luna-translator"

    # Desktop files
    install -Dm644 LunaTranslator.desktop "${pkgdir}/usr/share/applications/LunaTranslator.desktop"
    install -Dm644 LunaTranslator.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LunaTranslator.png"
}