# Maintainer: SuperITMan <admin(at)superitman(dot)com>

pkgname=rattlesnakeos-stack-bin
pkgver=11.0.4
pkgrel=1
pkgdesc="RattlesnakeOS stack tool to install RattlesnakeOS on your phone"
arch=('x86_64')
url="https://github.com/dan-v/rattlesnakeos-stack"
license=('GPL3')
makedepends=('unzip')
optdepends=("aws-cli: Universal Command Line Interface for Amazon Web Services")
source=("${pkgname}-${pkgver}.zip::https://github.com/dan-v/rattlesnakeos-stack/releases/download/v${pkgver}/rattlesnakeos-stack-linux-${pkgver}.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=("3611804cbd532b404e6ac2a66034f2e6787e490439041d772ae08245ee635ff1")

prepare() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
    unzip -o ${pkgname}-${pkgver}.zip -d "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
    chmod +x "${srcdir}/${pkgname}-${pkgver}-${pkgrel}/rattlesnakeos-stack"
}

package() {
    # install binary
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/${pkgname}

    install "${srcdir}/${pkgname}-${pkgver}-${pkgrel}/rattlesnakeos-stack" "${pkgdir}/usr/share/${pkgname}/rattlesnakeos-stack"
    ln  -s /usr/share/${pkgname}/rattlesnakeos-stack ${pkgdir}/usr/bin/rattlesnakeos-stack
}
