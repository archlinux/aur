# Maintainer: SuperITMan <admin(at)superitman(dot)com>

pkgname=rattlesnakeos-stack-bin
pkgver=10.0.10
pkgrel=1
pkgdesc="RattlesnakeOS stack tool to install RattlesnakeOS on your phone"
arch=('x86_64')
url="https://github.com/dan-v/rattlesnakeos-stack"
license=('GPL3')
makedepends=('unzip')
optdepends=("aws-cli: Universal Command Line Interface for Amazon Web Services")
source=("${pkgname}-${pkgver}.zip::https://github.com/dan-v/rattlesnakeos-stack/releases/download/v${pkgver}/rattlesnakeos-stack-linux-${pkgver}.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=("1c731b08f05679bb2644ef974d226333feeca0cad30314dd7b2a4cca27458236")

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
