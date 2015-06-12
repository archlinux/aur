# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=nixieclock
pkgver=1.64
pkgrel=1
pkgdesc="a simple little desktop clock that displays the current date and time using little icons of actual nixie tube digits"
arch=('i686' 'x86_64')
url="http://seriss.com/people/erco/unixtools/nixieclock/"
license=('GPL-2')
depends=('fltk')
source=(http://seriss.com/people/erco/unixtools/${pkgname}/${pkgname}-${pkgver}.tar.gz nixieclock.desktop)
md5sums=('957f44ba9bf0b0f189e2374f1d952842'
         '7a94c95044f8027ec600554ed9a7844d')

build() {
cd ${srcdir}/${pkgname}-${pkgver}
sed -i 's%FLTK_DIR=/usr/local/src/fltk-1.3.x-svn%FLTK_DIR=/usr/bin%' Makefile
make
}

package() {
cd ${srcdir}/${pkgname}-${pkgver}
install -D -m755 ./nixieclock ${pkgdir}/usr/bin/nixieclock
install -D -m755 ./nixie-text-viewer ${pkgdir}/usr/bin/nixie-text-viewer
install -D -m644 icons/nixieclock-icon.png $pkgdir/usr/share/pixmaps/nixieclock-icon.png
install -D -m644 $srcdir/nixieclock.desktop $pkgdir/usr/share/applications/nixieclock.desktop
}
