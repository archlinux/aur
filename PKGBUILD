# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=platon
pkgver=2019.12.16
pkgrel=1
pkgdesc="A Multipurpose Crystallographic Tool"
arch=("x86_64")
url="http://www.cryst.chem.uu.nl/spek/platon"
license=('custom')
depends=('gcc-libs' 'libx11')
makedepends=('gcc-fortran' 'gzip' 'tar')
source=("https://www.platonsoft.nl/spek/xraysoft/unix/$pkgname.tar.gz")
sha256sums=('3f05cc40c9cf903195a2788d0e77497ee0e38b14b0869aba57ab60097628eb4e')

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
