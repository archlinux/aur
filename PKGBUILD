# Maintainer: meister1593 <leruop@gmail.com>
pkgname=tcgui-git
_pkgname=tcgui
pkgver=57d33c4
pkgrel=1
pkgdesc="Small software application for transforming your voice or music in real-time."
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
