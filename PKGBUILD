# Maintainer: cyberxndr <cyberxndr@gmail.com>

pkgname=mytetra
pkgver=1.43.27
pkgrel=1
pkgdesc="Personal manager for data memorization and structuring notes"
arch=('x86_64')
url="https://github.com/xintrea/mytetra_dev"
license=('GPL3')
source=("https://webhamster.ru/db/data/articles/105/mytetra_1_43_27_lin_64.tar.gz"
        "https://gist.githubusercontent.com/cyberxndr/498db38606e53a56efb32d79a2c73b4a/raw/82f2a036d300058f6253732609654e73a8b8e020/mytetra.desktop")
noextract=( "mytetra.desktop")

md5sums=('b6282f94d7271ee1a994c9ce17bb9085'
         '52f0675d8fa88fa9a388e0f4a54fa7e6')

prepare(){
    cd mytetra_1_43_27_lin_64
    echo '#!/bin/sh' > mytetra.run
    echo 'PROGDIR="/opt/mytetra"' >> mytetra.run
    echo 'LD_LIBRARY_PATH=$PROGDIR/lib:${LD_LIBRARY_PATH}' >> mytetra.run
    echo 'export LD_LIBRARY_PATH' >> mytetra.run
    echo '$PROGDIR/mytetra' >> mytetra.run 
}



package(){
    install -Dm 644 mytetra_1_43_27_lin_64/mytetra.png "${pkgdir}/usr/share/pixmaps/mytetra.png"
    install -Dm 644 mytetra.desktop "${pkgdir}/usr/share/applications/mytetra.desktop"

    cd mytetra_1_43_27_lin_64

    mkdir -p "${pkgdir}/opt/mytetra"
    cp * "${pkgdir}/opt/mytetra/" -r

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/mytetra/mytetra.run "${pkgdir}/usr/bin/mytetra" 
}

