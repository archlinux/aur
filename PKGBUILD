# Maintainer: Tu Nombre <tu.email@dominio.com>
pkgname=nmsxtiles-git
pkgver=0.9.6.0
pkgrel=1
pkgdesc="nMSXtiles is a tile and sprite editor for MSX in screen modes SC2 and SC4"
arch=('x86_64')
url="https://github.com/pipagerardo/nMSXtiles"
license=('GPL3')
depends=('qt5-base')  
makedepends=('git')   
source=("git+${url}.git"
        "prepare.patch")
sha256sums=('SKIP'
            'e5b85b500af2a431f2a868ff63c1ee8ca4b97cbfdde58cc1761a4576b23e72b3') 

prepare() {
    cd nMSXtiles
    git apply ../../prepare.patch
}

build() {
    cd "$srcdir/nMSXtiles"
    qmake src/nmsxtiles.pro
    make
}

package() {
    cd "$srcdir"
    mkdir $pkgdir/usr
    mkdir $pkgdir/usr/bin
    mkdir $pkgdir/usr/share
    mkdir $pkgdir/usr/share/nMSXtiles
    cp $srcdir/build/nMSXtiles $pkgdir/usr/bin
    cp -r $srcdir/nMSXtiles/build/. $pkgdir/usr/share/nMSXtiles
}
