# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

_pkgbase=unofficial-homestuck-collection
pkgname="${_pkgbase}-bin"
pkgver=2.0.7
pkgrel=4
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url="https://bambosh.github.io/unofficial-homestuck-collection/"
license=('custom:chrome' 'custom:electron')
depends=('libvips')
makedepends=('gendesk')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!strip')
source=("https://github.com/Bambosh/${_pkgbase}/releases/download/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz"
        "icon.svg"
        "icon-16.png"
        "icon-24.png"
        "icon-32.png"
        "icon-48.png"
        "icon-64.png"
        "icon-128.png"
        "icon-256.png"
        "icon-512.png")
sha512sums=('0dbb0745d86240c2b9ddbe52afa02e9c292b3df838a769adb5b21fc1a65917e9dbcef0b337d7a0cad4fc0398b6ae036ab1796c39b34d614eadcabd6807f0ebba'
            'ddd708069851fe45d519265906be1c5ea6fb39ba3a908eddb1f8e74304521ab5138ea4e6125c0ef3a0189d48f281099014e3eea60dca276698d678e43a264825'
            '61168758fdde408282c673724d20c13438ec9dd2e9d7bfa1cf5b265d85476b43a386899bff136bd284293bf2bc5799174248e7fe98dd6d0086507ee22b2a5923'
            '509c7a1b8ceeffa99b4f8012de75a429909ee4b464b753a6ffec910e0c88a705f1d70ed2fd4c81a9cf53aff6681e2f766429b71339acb594e231abafc0f04f04'
            '411b191c576e3c153a966ca6f013fdf7d9f97e2d31af207415f53abed8ded91d535706947fa5bc05efd5603a4dda2f297aeb30e4f1b561b35e28954379a0cc01'
            '07d951403df506b9a731e92780d154b53bd19cda0f8db5a5d65d14ae0dfb9040a74f464a114ec4ae0e4fafa2c0b08b2b78d2fc36d6575ceee13e24fd39b8e927'
            '3970acac727b0f50e4fb6d6dc82e883e3863f6787985451224f69cc26ba30154d6913e490374a603ff3a3d996268f4090ae9e29652cf137f9a05c2902424f477'
            '92bdac1d9dd070dc0fa84531e6409dc7849c72658aa4c61ac19434d0f04ba6203831583748b1f0ac3cee00654a203caa886270bbaaf6526e9a91f0b5e831a9d6'
            'e3b9ae1c6ba30f5739bd6b770b77818fa87a84270bf663b6133fbebb2c516506480cbcc51fb232fe54be47c512c204f36784b3a667f6d8464e07341e31b41364'
            '02afa3cad5468a8fac9ed67483bff4ab62fb91403303ceab96823bc8db38644be816d7056eeb533a6bb1511c86ccd30ad1b3bb5943a7207aa735cefff167d52c')

prepare() {
    gendesk -f -n \
        --pkgname="${_pkgbase}" \
        --pkgdesc="${pkgdesc}" \
        --name="Unofficial Homestuck Collection" \
        --categories "Game;" \
        --exec="/usr/bin/unofficial-homestuck-collection"
}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -r "${srcdir}/unofficial-homestuck-collection-${pkgver}/" "${pkgdir}/opt/unofficial-homestuck-collection/"

    mkdir -p "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/"
    ln -s "/opt/unofficial-homestuck-collection/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/LICENSES.chromium.html"
    ln -s "/opt/unofficial-homestuck-collection/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/LICENSE.electron.txt"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/unofficial-homestuck-collection/unofficial-homestuck-collection" \
        "${pkgdir}/usr/bin/unofficial-homestuck-collection"

    install -Dm644 "${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"

    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "icon-${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgbase}.png"
    done

    install -Dm644 "icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgbase}.svg"
}
