# Maintainer: thr <r at sledinmay dot com>
# Contributor: Emmanuele Massimi <finferflu at gmail dot com>
pkgname=gtkmagnetic
pkgver=2.3
pkgrel=8
pkgdesc="An interpreter for British text adventures by Magnetic Scrolls."
arch=(i686 x86_64)
url="http://mirror.ifarchive.org/indexes/if-archiveXmagnetic-scrollsXinterpretersXmagnetic.html"
license=('GPL')
depends=('gtk2' 'smpeg')
source=("http://mirror.ifarchive.org/if-archive/magnetic-scrolls/interpreters/magnetic/Magnetic23Src.zip"
	gargoyle.patch ms_init.patch glibc.patch gtkmagnetic.desktop gtkmagnetic.png)
md5sums=('74b0d027c6a70e39d9447f12c215e8a9'
         '2f1dcd0446348b32a873d591ce670a37'
         'ec4cb13ac5f78d46069baf83ba674542'
         'd5c5e901442b913279eca35467066222'
         '2298ab45562d480d9d383242fa93dfdb'
         '04c0dcca4ad7f1e9eedf5f32fc5958f1') 

prepare() {
 patch -Np0 -i gargoyle.patch
 patch -Np0 -i glibc.patch
 patch -Np0 -i ms_init.patch
}

build() {
 cd Gtk
 make
}

package() {
 install -D Gtk/gtkmagnetic ${pkgdir}/usr/bin/gtkmagnetic
 ln -s /usr/bin/gtkmagnetic ${pkgdir}/usr/bin/magnetic
 install -D -m644 Gtk/README ${pkgdir}/usr/share/gtkmagnetic/README
 cp Gtk/BUGS ${pkgdir}/usr/share/gtkmagnetic/
 install -D -m644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
 install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
