# Maintainer: cookie <coookieuniverse@gmail.com>
pkgname=staruml
pkgver=6.3.1
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source=("$pkgname-${pkgver}_amd64.deb::https://staruml.io/api/download/releases-v6/StarUML_${pkgver}_amd64.deb")
sha256sums=('1c909066bdefa61c4b7ae1d592ae9f4996a2f0f7c92b286e6a8a0578e506c522')

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
