# Maintainer: Christian Bundy <christianbundy@fraction.io> 
pkgname=patchbay
pkgver=8.0.1
pkgrel=3
pkgdesc="An alternative Secure Scuttlebutt client interface that is fully compatible with Patchwork"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchbay"
license=('MIT')
depends=('libsodium' 'gtk2' 'gconf' 'python' 'electron4')
makedepends=('nodejs' 'npm' 'git')
options=(!strip)

source=(
"https://github.com/ssbc/${pkgname}/archive/v${pkgver}.zip"
'run.sh'
"${pkgname}.desktop"
)

md5sums=('33d51bd5114df2da89d3847b25668870'
         'abfe60313ffa85d809d349149aefebcb'
         'f459479fef0987c5fa81a38b04767ffa')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm ci
    rm -rf node_modules/electron
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D build/icon.svg "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.svg"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
}
