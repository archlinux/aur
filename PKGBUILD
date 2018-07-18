# Maintainer: Christian Bundy <christianbundy@fraction.io>

pkgname=patchbay
pkgver=7.13.1
pkgrel=1
pkgdesc="An alternative Secure Scuttlebutt client interface that is fully compatible with Patchwork "
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchbay"
license=('MIT')
depends=('libsodium' 'gtk2' 'gconf' 'python' 'lib32-gcc-libs')
makedepends=('nodejs' 'npm')
options=(!strip)
source=(
"https://github.com/ssbc/${pkgname}/archive/v${pkgver}.tar.gz"
'run.sh'
"${pkgname}.desktop"
)

md5sums=('6ad303f916136ac12d53e1058be25798'
         'fae47b2d8539295743f7946ea07393c4'
         'f459479fef0987c5fa81a38b04767ffa')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
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
