# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=platon
pkgver=2019.12.09
pkgrel=1
pkgdesc="A Multipurpose Crystallographic Tool"
arch=("x86_64")
url="http://www.cryst.chem.uu.nl/spek/platon"
license=('custom')
depends=('gcc-libs' 'libx11')
makedepends=('gcc-fortran' 'gzip' 'tar')
source=("https://www.platonsoft.nl/spek/xraysoft/unix/$pkgname.tar.gz")
sha256sums=('36fea6e6483559fd21615314a05b7e7afaf6951ed8c0bc656fb797a840302f8d')

build() {
    cd $pkgname
    mkdir share
    gzip -d *.gz
    tar xf *.tar -C share
    gfortran $FCFLAGS -o platon platon.f xdrvr.c -lX11
}

package() {
    cd $pkgname
    install -dm755 $pkgdir/usr/{bin,share/licenses/$pkgname}
    install -m755 platon $pkgdir/usr/bin
    cp -r share/* $pkgdir/usr/share
    chmod -R 755 $pkgdir/usr/share
    cat <<EOF > $pkgdir/usr/share/licenses/$pkgname/LICENSE
C **********************************************************************
C * THIS PROGRAM MAY BE USED FREE OF CHARGE ONLY FOR USE WITHIN THE    *
C * ACADEMIC COMMUNITY AND NOT FOR PROFIT WITHOUT EXPLICIT PERMISSION  *
C * IT IS TO BE UNDERSTOOD THAT THE AUTHOR OR HIS UNIVERSITY CANNOT    *
C * BE HELD RESPONSIBLE FOR ANY PROBLEMS CAUSED BY ERRORS IN THE CODE  *
C **********************************************************************
EOF
}
