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
sha256sums=('c2f6c56167f0acdbe3dc37cca9c1a19260c040f2d4800e3529a21ad7cce275fe'
            'bc36426772e1471d6dd8c8aed91f288e16949e3463a9933fee6390ee0ccd3f81'
            '9604eca891f80bcc24b6b543ad18b8f5f2b9e608b62d6c852146e3e19e30f9db'
            '0f3cce6c8f9995f4f6a930ddb93e62cc74d6fa8d6db1387d458bab80ad8e32cf')

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
