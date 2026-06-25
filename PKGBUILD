# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=softplan-websigner
_pkgver=2.15.0
pkgver=${_pkgver}.1
pkgrel=1
pkgdesc="The Web Signer native application.. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="https://websigner.softplan.com.br"
license=('custom')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
DLAGENTS=('https::/usr/bin/curl -k -o %o %u')
source=("${pkgname}-${pkgver}-64.deb::https://websigner.softplan.com.br/Downloads/${_pkgver}/webpki-chrome-64-deb")
sha512sums=('54bb4dd51f3ea442db2789f15bde5ee3e5fb92a7b8dc269198b700f75a731918c8eaefa7c7aa3a6c08086e7d0efc133f55b6f112fc8213b7401cc850e250f6de')

package(){

    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    #  Fix directory structure differences
    rm -rf "${pkgdir}"/usr/lib/*
    mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib
    rm -rf "${pkgdir}"/usr/lib64

    # Archify folder permissions
    cd ${pkgdir}
    for d in $(find . -type d); do
        chmod 755 $d
    done

}
