# Maintainer: cyberxndr <cyberxndr@gmail.com>

pkgname=mytetra
pkgver=1.42.2
pkgrel=3
pkgdesc="Personal manager for data memorization and structuring notes"
arch=('x86_64')
url="https://github.com/xintrea/mytetra_dev"
license=('GPL3')
source=("http://webhamster.ru/db/data/articles/105/mytetra_1_42_2_lin_64.tar.gz"
        "https://macin.files.wordpress.com/2012/08/mytetra-1-30-icon.png"
        "https://gist.githubusercontent.com/cyberxndr/498db38606e53a56efb32d79a2c73b4a/raw/82f2a036d300058f6253732609654e73a8b8e020/mytetra.desktop")
noextract=("mytetra-1-30-icon.png"
           "mytetra.desktop")

md5sums=('54e36bac3f2d06d2d1bf6fd77501bb63'
         '5a4e7778d6e042582db6d6e04530a4a1'
         '52f0675d8fa88fa9a388e0f4a54fa7e6')

prepare(){
    cd mytetra_1_42_2_lin_64
    echo '#!/bin/sh' > mytetra.run
    echo 'PROGDIR="/opt/mytetra"' >> mytetra.run
    echo 'LD_LIBRARY_PATH=$PROGDIR/lib:${LD_LIBRARY_PATH}' >> mytetra.run
    echo 'export LD_LIBRARY_PATH' >> mytetra.run
    echo '$PROGDIR/mytetra' >> mytetra.run 
}



package(){
    install -Dm 644 mytetra-1-30-icon.png "${pkgdir}/usr/share/pixmaps/mytetra.png"
    install -Dm 644 mytetra.desktop "${pkgdir}/usr/share/applications/mytetra.desktop"

    cd mytetra_1_42_2_lin_64

    mkdir -p "${pkgdir}/opt/mytetra"
    cp * "${pkgdir}/opt/mytetra/" -r

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/mytetra/mytetra.run "${pkgdir}/usr/bin/mytetra" 
}
