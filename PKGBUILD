# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname='luna-translator'
pkgver='10.16.5.4'
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
    '5705e65cb9c2b57e3bec41d788fd7cfc1c6ad0bb22a12433a1f52c12d43ee050f6229381a5e0858b1cf3adc8c207657bdcfeff19b65f77b6ee1404d014e445f9'
    'eb4721d6a45fdc8b1f4552065590c5eebe90f0f5739ef0de32bf60c0a524b5e419ad841fc6bc98329c66dc92253f6ec829ca13244a84f67750f48349d5294741'
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