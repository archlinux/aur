# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 29 May 2010

pkgname=today
pkgver=0.66
pkgrel=2
pkgdesc="Eortologio is a console utility that displays fixed and movable feasts of the Greek calendar."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gtoday/"
license=('GPLv2')
depends=()
makedepends=('gcc')
options=('strip')
source=(g${pkgname}-${pkgver}.tar.bz2::http://downloads.sourceforge.net/g$pkgname/g$pkgname-$pkgver.tar.bz2
	archfs.patch)
install=${pkgname}.install
sha256sums=('b8a6ab6c28ed18054456a196a12c61547dff7556c6e0d6436fbd6447f284cf1b'
            '50677fae0180e2e20b59c5c230a85497784573c1e20bf4c7665684ad8a231a9b')

build() {
    mv g$pkgname-$pkgver $pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
    patch -p0 -i ${srcdir}/archfs.patch
    make
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/today
    cd $srcdir/$pkgname-$pkgver
    cp today ${pkgdir}/usr/bin
    cp README INSTALL TODO Changelog LICENSE personal.dat today.dat config ${pkgdir}/usr/share/today/
}
