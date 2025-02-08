# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=softplan-websigner
_pkgver=2.12.1
pkgver=${_pkgver}.1
pkgrel=2
pkgdesc="The Web Signer native application.. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="https://websigner.softplan.com.br"
license=('custom')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
DLAGENTS=('https::/usr/bin/curl -k -o %o %u')
source=("${pkgname}-${pkgver}-64.deb::https://websigner.softplan.com.br/Downloads/${_pkgver}/webpki-chrome-64-deb")
sha512sums=('01a03ef086008c12e76409dd40f36ab15c00fae53f991d8e9ff7862243067052c341182df459076ccff86392ef8780d8d7438bc8107e5da47f59df03d5c05b50')

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
