# Maintainer: thr <r at sledinmay dot com>
# Contributor: Emmanuele Massimi <finferflu at gmail dot com>
pkgname=gtkmagnetic
pkgver=2.3.1
pkgrel=1
pkgdesc="An interpreter for British text adventures by Magnetic Scrolls."
arch=(i686 x86_64)
url="https://mirror.ifarchive.org/indexes/if-archive/magnetic-scrolls/interpreters/magnetic/"
license=('GPL-2.0-or-later')
depends=('gtk2' 'smpeg0')
source=("https://mirror.ifarchive.org/if-archive/magnetic-scrolls/interpreters/magnetic/Magnetic231Src.zip"
	gargoyle.patch gtk.patch gtkmagnetic.desktop gtkmagnetic.png)
md5sums=('7f1061387a9811e1cd609ab20d8d6c42'
         '7af6655303b480562920a99e854202dc'
         'a086bf31bcf244a5d6face4e7f84a30e'
         '2298ab45562d480d9d383242fa93dfdb'
         '04c0dcca4ad7f1e9eedf5f32fc5958f1')

prepare() {
 patch -Np0 -i gtk.patch
 patch -Np0 -i gargoyle.patch
}

build() {
 cd Gtk
 make
}

package() {
 install -D Gtk/${pkgname} ${pkgdir}/usr/bin/${pkgname}
 ln -s /usr/bin/${pkgname} ${pkgdir}/usr/bin/magnetic
 install -D Gtk/README ${pkgdir}/usr/share/${pkgname}/README
 install -D Gtk/BUGS ${pkgdir}/usr/share/${pkgname}/BUGS
 install -D Scripts/* -t ${pkgdir}/usr/share/${pkgname}/Scripts
 install -D ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
 install -D ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
