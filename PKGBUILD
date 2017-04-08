# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=n1
pkgver=2.0.8
_pkgver=3e0b575
pkgrel=1
pkgdesc="Nylas Mail: A new mail client for Linux, Mac and Windows, built on the modern web and designed to be extended. (formerly N1)"
arch=('x86_64')
url="https://nylas.com"
license=('MIT')
depends=('gtk2' 'libgnome-keyring' 'gnome-keyring' 'desktop-file-utils' 'python2' 'gconf' 'nodejs' 'libnotify' 'libxtst' 'nss' 'alsa-lib' 'libxss')
source=(http://edgehill.s3.amazonaws.com/${pkgver}-${_pkgver}/linux-deb/x64/NylasMail.deb)
install=${pkgname}.install
md5sums=('2540a8985d3e2400548afd4d696d50a9')
package() {
    msg2 "Extracting data.tar.gz..."
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    cd "${pkgdir}"
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/python\s*$|#!/usr/bin/python2|' {} \;
    
    
    find "${pkgdir}"/usr -type f -exec chmod 644 {} \;
    find "${pkgdir}"/usr/bin -type f -exec chmod 755 {} \;
    find "${pkgdir}"/usr -type d -exec chmod 755 {} \;
    chmod 755 "${pkgdir}"/usr/share/nylas-mail/nylas
    chmod 755 "${pkgdir}"/usr/share/nylas-mail/resources/apm/bin/{node,apm}

    mkdir -p "${pkgdir}"/usr/share/licenses/nylas-mail/

    rm -rf "${pkgdir}/usr/bin/nylas"
    ln -s /usr/share/nylas-mail/nylas "${pkgdir}"/usr/bin/nylas
    ln -s /usr/share/nylas-mail/LICENSE "${pkgdir}"/usr/share/licenses/nylas-mail/LICENSE
}
