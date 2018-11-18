# Maintainer: f1she3 <f1sher@gmx.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=dwm-keycodes
_pkgname=dwm
pkgver=6.1
pkgrel=1
patchname=keycodes
patchver=$pkgver
pkgdesc="A dynamic window manager for X - with keycodes patch"
url="https://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'st' 'dmenu')
provides=('dwm')
conflicts=('dwm')
install=${_pkgname}.install
source=(https://dl.suckless.org/dwm/dwm-$pkgver.tar.gz dwm.desktop config.h
https://dwm.suckless.org/patches/$patchname/${_pkgname}-$patchname-$patchver.diff)
md5sums=('f0b6b1093b7207f89c2a90b848c008ec'
         '939f403a71b6e85261d09fc3412269ee'
         '948cb0fa3bc0c2fa0b90d654acda1827'
         '8bebc6b37fc6229b9b08ded6babf3fd2')

prepare() {
	cd $srcdir/${_pkgname}-$pkgver
	patch -p1 -i ../${_pkgname}-$patchname-$patchver.diff
	cp $srcdir/config.h config.h
}

build() {
	cd $srcdir/${_pkgname}-$pkgver
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd $srcdir/${_pkgname}-$pkgver
	make PREFIX=/usr DESTDIR=$pkgdir install
	install -m644 -D LICENSE $pkgdir/usr/share/licenses/${_pkgname}/LICENSE
	install -m644 -D README $pkgdir/usr/share/doc/${_pkgname}/README
	install -m644 -D $srcdir/dwm.desktop $pkgdir/usr/share/xsessions/dwm.desktop
}
