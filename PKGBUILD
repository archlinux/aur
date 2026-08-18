# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname='luna-translator'
pkgver='10.16.3.4'
pkgrel=1
pkgdesc='Visual Novel Translator'
arch=(x86_64)
url='https://lunatranslator.org/'
license=('GPL-3.0-only')
options=(!debug)

depends=('wine')
optdepends=('ollama: Use local translation model')

source=(
    "${pkgname}_${pkgver}.zip::https://github.com/HIllya51/LunaTranslator/releases/download/v${pkgver}/LunaTranslator_x64.zip"
    'luna-translator'
    'LunaTranslator.desktop'
    'LunaTranslator.png'
)
b2sums=(
    '3d981119bd56896cd780775fb52f250715ca48d4ec39646f19442505c5201d995fef43ac25e5c1c6ce2542abd6b9468d8869d3e5e3ef73bad9e79e06a8412fb8'
    '89bfdaec7169e8ad5d336ccb55a25d68f398a74509083ded1ed01ed8555128f48bcf5e927eaa4e8975d5f48e099bac6010cb4731eedc9fc7f6f5add62fbc313c'
    '96791975a8d6ff19e0de383f92bfeba3e805ef482c803c07801ea70a67c59c0b5ff056c3dac4b6a56a48811abea83bc28760259aad5ee7f02e7051996f5eb42b'
    '631ab7da2757459c7da9a1ac335cf9d9c920facb8fc589ab135ef762083df73b982a3c5bc3fbe56036ff0bb27303e0961196726ee503730aa9095bae5a957ab2'
)

prepare() {
    cd 'LunaTranslator_x64'
    # Clean-up
    rm -rf 'LunaTranslator_admin.exe' 'LunaTranslator_debug.bat'
    # Set permissions
    find . -type d -exec chmod 755 "{}" \;
    find . -type f -exec chmod 644 "{}" \;
}

package() {
    install -d -m755 "${pkgdir}/usr/share/${pkgname}"
    mv LunaTranslator_x64/* "${pkgdir}/usr/share/${pkgname}"

    install -Dm755 luna-translator "${pkgdir}/usr/bin/luna-translator"

    # Desktop files
    install -Dm644 LunaTranslator.desktop "${pkgdir}/usr/share/applications/LunaTranslator.desktop"
    install -Dm644 LunaTranslator.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LunaTranslator.png"
}