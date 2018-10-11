# Maintainer: Christian Bundy <christianbundy@fraction.io> 
pkgname=patchbay
pkgver=7.15.0
pkgrel=1
pkgdesc="An alternative Secure Scuttlebutt client interface that is fully compatible with Patchwork"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchbay"
license=('MIT')
depends=('libsodium' 'gtk2' 'gconf' 'python' 'electron')
makedepends=('nodejs' 'npm' 'git')
options=(!strip)

source=(
"https://github.com/ssbc/${pkgname}/archive/v${pkgver}.zip"
'run.sh'
"${pkgname}.desktop"
)

md5sums=('38ac8a510cf45028792b68f81927efe3'
         'eb46b144f64a8b91696292ee5bfca0b3'
         'f459479fef0987c5fa81a38b04767ffa')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm ci --only=production
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
}
