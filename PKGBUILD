# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

_pkgbase=unofficial-homestuck-collection
pkgname="${_pkgbase}-bin"
pkgver=2.7.2
pkgrel=1
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url='https://homestuck.giovanh.com/unofficial-homestuck-collection/'
license=('GPL-3.0-or-later' 'LicenseRef-chrome' 'LicenseRef-electron')
makedepends=('gendesk')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libvips'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxcrypt-compat'
    'libxcursor'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxi'
    'libxrandr'
    'libxrender'
    'libxss'
    'libxtst'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!strip')
source=("https://github.com/GiovanH/${_pkgbase}/releases/download/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz"
        "16x16.png"
        "24x24.png"
        "32x32.png"
        "48x48.png"
        "64x64.png"
        "128x128.png"
        "256x256.png"
        "512x512.png"
        "1024x1024.png")
sha512sums=('201313165095c7eefd9e8d2123595a9220db38540dc9ddb9eb739b095cb40a3305843675baf91bc4b59f6dd4bb94541d92541c1b0228d1789be12fadc089ecfa'
            'c306002d6296c83272c6e030c7e8be8545380a4ef859bdb1a4edf865286cc0e1b585d85f6ac9bf23d31639e3cee02e0d87ff13ef7afd3c804617f5af2e936b31'
            'adecf88c02bad349a7e1fd175256cc8741ce22435172a067d7d8fddb20de0ee960ee99c20e215b9c4a5069eeba5dff1750f209b1beb9919b511803ba78aeb380'
            'e12fce5c7e457ba8c021ad9ff481d4af288351f04a0d6cb8b4a4bdd0f1e4f765efd0638b9edb9f2dae84463834d6f2494c09cdb155e16d9a36db408e54b49a74'
            '39fda5cd96775128e24cf7934fcf7a3e5e236c3764a9829bdf52e33890ee290e02e2b72c6faa64e883811fd34f491ef0c8aea45d80ee630f39b19f14088a4eec'
            '37f604627e2274f00108287d6f7b58e1128e3f195f904a6494b79bd6eda1c92b427a0c7cb354424d22fe236cf9b226809a1b8e136f2e924fd61cbe87efe1f05b'
            '43119af8a4afd0012c4e0f24caa1bf488c3071b98f7e54ad7bb123b977e5bd7c5e8627ef075312ec56b4e2982331d9d00aca5195c19623af4f40de0524b07b01'
            '757a46f3092a6b1ca15652aa9be4830b1a9262fe974d36c30892a19b80d2961057060b3dfd6934b82fb4f460484b90d381790cd1774c8f0f582e0ec872557c15'
            '85ff2cab541c994e3875994920a557f40a0a93dce308e25d0e2763b6f8c1d46ca0bafde268c38ab1a487e18213e73d0a257593823b5535571a4b3eb663e498c9'
            '0dbc83f3effbafff744308da90f3234971b1083c957d548bc3cc5b466fb5ea140beff9eb5001432d790ef8358c0edb462b1722ed20a9a3b7b99ac0fd01004292')

prepare() {
    gendesk -f -n \
        --pkgname="${_pkgbase}" \
        --pkgdesc="${pkgdesc}" \
        --name="Unofficial Homestuck Collection" \
        --categories "Game" \
        --exec="/usr/bin/unofficial-homestuck-collection"
}

package() {
    mkdir -p "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/${_pkgbase}-${pkgver}/" \
        "${pkgdir}/usr/lib/${_pkgbase}/"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/usr/lib/${_pkgbase}/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    ln -s "/usr/lib/${_pkgbase}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/usr/lib/${_pkgbase}/${_pkgbase}" \
        "${pkgdir}/usr/bin/${_pkgbase}"

    local size
    for size in 16 24 32 48 64 128 256 512 1024; do
        install -Dm644 "${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgbase}.png"
    done

    install -Dm644 "${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
}
