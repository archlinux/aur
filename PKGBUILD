# Maintainer: zuyoutoki <zuyoutoki+aur at oki dot moe>
pkgname=poly-via-bin
pkgver=fca28b60
pkgrel=2
epoch=
pkgdesc="VIA app for online course at PolyMTL"
arch=('x86_64')
url="https://polymtl.sviesolutions.com"
license=('custom')
depends=('libatomic_ops')
provides=('via' 'viascreensharing')
source=("https://polymtl.sviesolutions.com/Application/Via/Via.tar.xz")
md5sums=('SKIP')
options=(!strip)

pkgver() {
	shasum Via.tar.xz | sed -e 's/^\(.\{8\}\).*/\1/'
}

check() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"

	mkdir -p $pkgdir/opt/sviesolutions/via
	mkdir -p $pkgdir/opt/sviesolutions/viascreensharing
	mkdir -p $pkgdir/usr/share/applications

	cp -r -f via/* $pkgdir/opt/sviesolutions/via
	cp -r -f viascreensharing/* $pkgdir/opt/sviesolutions/viascreensharing
	cp -f via.desktop $pkgdir/usr/share/applications
	cp -f viascreensharing.desktop $pkgdir/usr/share/applications
	
	xdg-mime default via.desktop x-scheme-handler/viaapp
	xdg-mime default viascreensharing.desktop x-scheme-handler/viascreensharing
	
	chmod 777 -R $pkgdir/opt/sviesolutions/via
	chmod 777 -R $pkgdir/opt/sviesolutions/viascreensharing
}
