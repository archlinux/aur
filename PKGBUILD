# Maintainer: Marius Lindvall <marius {cat} varden {dog} info>
pkgname=cyberchef-electron
pkgver=9.27.6
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
sha256sums=('99df68c40aedb867db44095c290706309fa83a03324dec836b7f5d51fea12c7a'
            '0e936b556d83975e3ecf02e45433c46bf63fa303a31147fd8599f22fcb2d61e1'
            'e6582ba4f0f6141f62f6214420abcf524475f5a887e3aaee6169974f78462589'
            'a48ce4a789367ddb66ff49bcdb12f5f7c540581b4c78c93e3a3cb6440d60ade8'
            'e61bcdb9df37f14deea5fefcbae40eb4a3609887946ac08651a1b65e434c7042'
            'a1d095d83601902f9ec741f6586429d9f1f4052187f2aee022e6cfcea1f9cf3a'
            '8700203f930a1fac32f69f4b8f8e01fd832444a29ff7f73cbde66194f2350155')
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
