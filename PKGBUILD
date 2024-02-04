# Maintainer: Antonio Voza <vozaanthony {at} gmail {dot} com>
pkgname=cyberchef-electron
pkgver=10.6.0
pkgrel=1
pkgdesc="The Cyber Swiss Army Knife (unofficial Electron wrapper)"
arch=('any')
url="https://github.com/gchq/CyberChef"
license=('Apache')
depends=('electron')
makedepends=('unzip')
conflicts=()
source=("https://github.com/gchq/CyberChef/releases/download/v${pkgver}/CyberChef_v${pkgver}.zip"
        "https://raw.githubusercontent.com/gchq/CyberChef/master/src/web/static/images/logo/cyberchef_hat_512.png"
        "https://raw.githubusercontent.com/gchq/CyberChef/master/src/web/static/images/logo/cyberchef_hat.svg"
        "main.js"
        "prompt.js"
        "cyberchef.sh"
        "cyberchef.desktop")
sha512sums=('80338ea57b28e94cdb7f10f6664eee0ffecb04fdfeabc0a319dd94141a44f6a888350f180976b387dcac92eca08a1c8f450fb8072ff5c726681af4ec7f1cc34b'
            'd4515b4a2a12818553e29e371b8aedb61758cc33b12be325b6bb4d85e7ee87650d09752fa100df8ee68ce335c620b91e7ffd4d55ff4e4428f57af42845ef39c9'
            '7aa13db4949172532c390d4fab49361a3b0af91b2d18c1db61cf2d6581e34455c1068ad7278ff86b37f72528dcf72b39937b6744695d60b8273c70bc0c377240'
            '76a975d237bfc000ed601ed22c5629eaf7fdc072ee1e4ce6b186007f0311e813a1fb453797fa499648641d7612908cbdfa8a49a0e06a18b9c3b35a0aae21a3a1'
            '4d1d082dda5fa760520fd3059346681024fe88dae81104f810a8bfeaf8f01cfbcbdb356f557b198e5f3d99630d0acb0fec4bac65efcd790091b67d97d62f725c'
            'fbbf61eeb3b46ce811e34c30b174f8ae44944334366fa67c5639cf0c9b07e040841f349ca39f8f4377c801236ddbfb77dbf271d3c6060a2873ddd6406b9cd24c'
            '3269b084a10d24b6f0c556217454fb4bb52211900cf68f1113f23528e8ad2d2666c489c18ad41201414b854077bac3259ccd42cc248f98be1e4418b2afe72bb6')
options=(!strip)
noextract=("CyberChef_v${pkgver}.zip")

prepare() {
    unzip -o "CyberChef_v${pkgver}.zip" -d "CyberChef_v${pkgver}"
    cd "${srcdir}/CyberChef_v${pkgver}"
    mv "CyberChef_v${pkgver}.html" "index.html"
    cat << EOF > package.json
{
    "name": "$pkgname",
    "version": "$pkgver",
    "description": "$pkgdesc",
    "main": "main.js"
}
EOF
}

package() {
    cd "${srcdir}/CyberChef_v${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/${pkgname}"
    cp -r * "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/main.js" "${pkgdir}/usr/lib/${pkgname}/main.js"
    install -Dm644 "${srcdir}/prompt.js" "${pkgdir}/usr/lib/${pkgname}/prompt.js"
    install -Dm644 "${srcdir}/cyberchef_hat_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cyberchef.png"
    install -Dm644 "${srcdir}/cyberchef_hat.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cyberchef.svg"
    install -Dm644 "${srcdir}/cyberchef.desktop" "${pkgdir}/usr/share/applications/cyberchef.desktop"
    install -Dm755 "${srcdir}/cyberchef.sh" "${pkgdir}/usr/bin/cyberchef"
}