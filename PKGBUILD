# Maintainer: snogard <snogardb at gmail dot com>

pkgname=foundryvtt-cli
pkgver=3.0.3
pkgrel=1
pkgdesc='The official Foundry VTT CLI'
arch=('any')
url=https://github.com/foundryvtt/foundryvtt-cli
license=(MIT)
depends=(
    'nodejs'
)

makedepends=(
    'npm'
)

provides=(
    'fvtt'
)

source=(
    "${url}/archive/refs/tags/${pkgver}.zip"
)
sha256sums=('df7367354b21eab3a67aca34dcd6b791b5167a76ff351c9a9b66252033d6d433')
options=(!strip)

prepare() {
    cd "${srcdir}/foundryvtt-cli-${pkgver}/"

    npm install

    rm -r ".github"
    rm ".gitignore"
    rm ".eslintrc.json"
    rm ".editorconfig" 
    rm ".npmignore"
    rm "config.example.yml"

    chmod +x fvtt.mjs
}

package() {
    echo "ciao"
    install -dm755 ${pkgdir}/usr/bin
    ln -s "/usr/lib/node_modules/@foundryvtt/foundryvtt-cli/fvtt.mjs" "${pkgdir}/usr/bin/fvtt"

    install -dm755 "${pkgdir}/usr/share/licenses/foundryvtt-cli/"
    install -Dm755 "${srcdir}/foundryvtt-cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/foundryvtt-cli/LICENSE"

    install -dm755 "${pkgdir}/usr/lib/node_modules/@foundryvtt/foundryvtt-cli"
    cp -r --no-preserve=mode,ownership "${srcdir}/foundryvtt-cli-${pkgver}/." "${pkgdir}/usr/lib/node_modules/@foundryvtt/foundryvtt-cli/"

    chmod +x "${pkgdir}/usr/lib/node_modules/@foundryvtt/foundryvtt-cli/fvtt.mjs"
}
