# Maintainer: benpiano800 <benpiano800@protonmail.com>
# Contributor: Noah Jelen <noahtjelen@gmail.com>

pkgname=2048-vanced-git
pkgver=0.1.3
pkgrel=2
pkgdesc="An advanced implementation of 2048"
arch=('i686' 'x86_64')
url="https://gitlab.com/NoahJelen/2048-vanced"
license=('GPL')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("git+https://gitlab.com/NoahJelen/2048-vanced")
conflicts=('2048-vanced')
md5sums=('SKIP')

build() {
    cd "2048-vanced"
    bash build.sh
}

package() {
    cd "2048-vanced"
    echo -e '#!/bin/sh\n/opt/v2048/v2048'>v2048.sh
    mkdir -p "$pkgdir/usr/share/applications/"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/"

    cp -r v2048/ "$pkgdir/opt/v2048"
    cp v2048.desktop "$pkgdir/usr/share/applications/v2048.desktop"
    cp v2048.sh "$pkgdir/usr/bin/v2048"
    chmod 755 "$pkgdir/usr/bin/v2048"
    chmod 755 "$pkgdir/opt/v2048/v2048"
    
    mkdir -p "$pkgdir/opt/v2048/data"
    chmod -R 777 "$pkgdir/opt/v2048/data"
}
 
