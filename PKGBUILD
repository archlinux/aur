# Maintainer: snogard <snogardb at gmail dot com>

pkgname=foundryvtt-cli
pkgver=1.1.0
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
sha256sums=('598695bbd65fa2e3f0b6d82bfa005043dca9d09ec08619e7f8d86b902d7f2bde')
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
