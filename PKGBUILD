# Maintainer: N/A <N/A>
pkgname=tcgui-git
_pkgname=tcgui
pkgver=1a5196e
pkgrel=1
pkgdesc="A lightweight Python-based Web-GUI for Linux traffic control (tc) to set, view and delete traffic shaping rules."
arch=('any')
url="https://github.com/tum-lkn/tcgui"
license=('custom:MIT')
depends=('python' 'python-flask')
makedepends=('git')
source=('git+https://github.com/tum-lkn/tcgui')
sha256sums=('SKIP')
provides=('tcgui')
conflicts=('tcgui')

pkgver() {
  cd "$_pkgname"
  git describe --always
}

package() {
    # init dirs
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/opt/tcgui

    # copy all files to package
    cp -a ${srcdir}/${_pkgname}/* ${pkgdir}/opt/${_pkgname}

    # make startup script and fix permissions
    echo '#!/bin/bash' > ${pkgdir}/usr/bin/${_pkgname}
    echo "python3 /opt/${_pkgname}/main.py" >> ${pkgdir}/usr/bin/${_pkgname}
    chmod 755 ${pkgdir}/usr/bin/${_pkgname}
}
