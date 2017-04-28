# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=nylas-mail-bin
_pkgname=nylas-mail
pkgver=2.0.31
_pkgver=e675deb
pkgrel=1
pkgdesc="Nylas Mail: A new mail client for Linux, Mac and Windows, built on the modern web and designed to be extended. (formerly N1, official binary version)"
arch=('x86_64')
url="https://nylas.com"
license=('MIT')
depends=('gtk2' 'libgnome-keyring' 'gnome-keyring' 'desktop-file-utils' 'python2' 'gconf' 'nodejs' 'libnotify' 'libxtst' 'nss' 'alsa-lib' 'libxss')
conflicts=('nylas-mail' 'nylas-mail-git')
source=(NylasMail-${pkgver}.deb::https://edgehill.s3.amazonaws.com/${pkgver}-${_pkgver}/linux-deb/x64/NylasMail.deb)
install=${_pkgname}.install
md5sums=('e1a744fa8ff91de05807f2aa4d63f297')
package() {
    msg2 "Extracting data.tar.gz..."
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    cd "${pkgdir}"
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/python\s*$|#!/usr/bin/python2|' {} \;
    
    
    find "${pkgdir}"/usr -type f -exec chmod 644 {} \;
    find "${pkgdir}"/usr/bin -type f -exec chmod 755 {} \;
    find "${pkgdir}"/usr -type d -exec chmod 755 {} \;
    chmod 755 "${pkgdir}"/usr/share/${_pkgname}/nylas
    chmod 755 "${pkgdir}"/usr/share/${_pkgname}/resources/apm/bin/{node,apm}

    mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}/

    rm -rf "${pkgdir}/usr/bin/nylas"
    ln -s /usr/share/${_pkgname}/nylas "${pkgdir}"/usr/bin/nylas
    ln -s /usr/share/${_pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
