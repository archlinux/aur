# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

_pkgbase=unofficial-homestuck-collection
pkgname="${_pkgbase}-bin"
pkgver=2.0.7
pkgrel=3
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
        "icon-16.png"
        "icon-24.png"
        "icon-32.png"
        "icon-48.png"
        "icon-64.png"
        "icon-128.png"
        "icon-256.png"
        "icon-512.png")
sha512sums=('0dbb0745d86240c2b9ddbe52afa02e9c292b3df838a769adb5b21fc1a65917e9dbcef0b337d7a0cad4fc0398b6ae036ab1796c39b34d614eadcabd6807f0ebba'
            '8874b44c24fa7b11275918d48e4b50226f13bf13816d6720af69f9643323a547a9046c92ae0ddf76aa93799e038bd60a4d2ea794ab74e2d901b3daedde07ad0f'
            'd41482b4e4594541f1a554e7d659f86910612490d2a49a34124763436ace95e300052eb92dc3920b2e3f0aeec6451ddfde20bd52ffe012a493ef17749d424427'
            '4ccaf6da380f977e4bdaa28c80a1e35938d50248c1c40e810d62c27308bbd5442a10634f10042c3dee07964b17881c5fe6e403d1cc61aa341ef1164dec550bab'
            'c5cff16f9a4d1b0cc49c31690f1958ba2d6f600b09020849330381a064225197021419b9fa79895acc6d1a57f3e9309aa704bf05ca40c78cd5b547a7416206a2'
            '53626ed5f2c996d923516830099a5e5b3ebb84b7dba54ab856839a63da95ea269ac192c6f76c0cb2c5df3e15c24f00cb2ed7d47650bb97b849cf2aaae6abddf9'
            'bda0e17656292f92e360eb0b2f0844c5fcbc82d01fdefaa2deca6b765755bcb10233c722e49c9d86e0da74b470e6909d1a22ab88847e915e228e8608df897687'
            '83bc52ad5d4682737274cb30dd680751fa61862f608d5735d326e59b1404eeea5e91cff1843adb11834cf800616a56c10347fcab611d6bb1e3c0c6ae364d9580'
            '8f6859d0a160d4bb430c1784be14dcaa5301cf0baaa0a425c70c2c4adb3fb1a084ea4802ba9ff955d70ae0aae4142f9b4cdecbaa28718daa06e706614181b5d6')

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
}
