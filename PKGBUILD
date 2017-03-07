# Maintainer: cyberxndr <cyberxndr@gmail.com>

pkgname=mytetra
pkgver=1.42.2
pkgrel=2
pkgdesc="Personal manager for data memorization and structuring notes"
arch=('x86_64')
url="https://github.com/xintrea/mytetra_dev"
license=('GPL3')
depends=('qt5-base'
         'qt5-svg')
source=("https://github.com/xintrea/mytetra_dev/archive/v.1.42.2.tar.gz")
md5sums=('b7cfdb281106b25b461d059a2a0607e2')

build(){
    cd ${pkgname}_dev-v.${pkgver}
    qmake
    make
}

prepare(){
    cd ${pkgname}_dev-v.${pkgver}

    echo '#!/bin/sh' > bin/mytetra.run
    echo 'LD_LIBRARY_PATH=lib:${LD_LIBRARY_PATH:+":$LD_LIBRARY_PATH"}' >> bin/mytetra.run
    echo 'export LD_LIBRARY_PATH' >> bin/mytetra.run
    echo '/opt/mytetra/mytetra' >> bin/mytetra.run
}

package(){
    cd ${pkgname}_dev-v.${pkgver}

    # install -D bin/mytetra "${pkgdir}/usr/bin/mytetra" 
    install -D -m755 bin/mytetra "${pkgdir}/opt/mytetra/mytetra"
    install -D -m755 bin/mytetra.run "${pkgdir}/opt/mytetra/mytetra.run" 

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/mytetra/mytetra.run "${pkgdir}/usr/bin/mytetra" 
}
