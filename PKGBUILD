# Maintainer: cookie <coookieuniverse@gmail.com>
pkgname=staruml
pkgver=7.1.0
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source=("$pkgname-${pkgver}_amd64.deb::https://staruml.io/api/download/releases-v7/StarUML_${pkgver}_amd64.deb")
sha256sums=('e63243e4d87e7f0f363c47586fade7a6b766720f20af728537e8a7b57e58c65e')

prepare() {
    # Extract package data
    cd "${srcdir}"
    tar xf data.tar.xz
}

package() {
    cd "${srcdir}"
    install -D -m644 "./opt/StarUML/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 4755 "./opt/StarUML/chrome-sandbox"
    cp -ra ./opt ./usr "${pkgdir}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s '/opt/StarUML/staruml' "${pkgdir}/usr/bin/staruml"
}
