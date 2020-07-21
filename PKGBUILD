# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=softplan-websigner
_pkgver=2.9.5
pkgver=${_pkgver}.1
pkgrel=2
pkgdesc="The Web Signer native application.. An easy solution for using digital certificates in Web applications."
arch=('i686' 'x86_64')
url="https://websigner.softplan.com.br"
license=('custom')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
DLAGENTS=('https::/usr/bin/curl -k -o %o %u')
source_i686=("https://websigner.softplan.com.br/Downloads/${_pkgver}/webpki-chrome-32-deb")
source_x86_64=("https://websigner.softplan.com.br/Downloads/${_pkgver}/webpki-chrome-64-deb")
sha512sums_i686=('c5d9a30f1a93fa1f75ef10e9632ed6d30b59a19fb1b50dbdd27f6effd6a841f1f903a790a21cdde4f7713dfc745961e0477091f7e321c73f508a5649658ee023')
sha512sums_x86_64=('a57b50c3f6f8f38282b4b1f9a39f7447c9fd87d4e1da549248e9657c201502cd9db035a3e59e7f3326e46a903ae7f6973e7e084b6fb2f38c3944079cdcd71372')

package(){

    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    if [[ ${CARCH} == x86_64 ]]; then
        rm -rf "${pkgdir}"/usr/lib/*; mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib; rm -rf "${pkgdir}"/usr/lib64
    fi

    if [[ ${CARCH} == i686 ]]; then
        rm -rf "${pkgdir}"/usr/lib64/*
    fi

    # Archify folder permissions
    cd ${pkgdir}
    for d in $(find . -type d); do
        chmod 755 $d
    done

}
