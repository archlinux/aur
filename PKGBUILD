# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=messenger-nativefier
pkgdesc="Facebook Messenger built into a desktop app using electron nativefier."
pkgver=1.0
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'pentium4')
url="https://messenger.com/"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')

build() {
    cd $srcdir
#    rm -Rf *

    nativefier \
        -p linux \
        --name "Facebook Messenger" \
        --verbose \
        --single-instance \
        --tray \
        https://messenger.com/
}


package() {
    mkdir -p ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin/

    _dirname=`ls ${srcdir} | grep "FacebookMessenger"`
    _binary="FacebookMessenger"
    echo "${_dirname} -> ${pkgdir}/opt/${pkgname}"
    cp -Rv ${_dirname}/* ${pkgdir}/opt/${pkgname}/

    ln -s ${pkgdir}/opt/${pkgname}/${_binary} ${pkgdir}/usr/bin/${pkgname}
}
