# Maintainer: thr <r at sledinmay dot com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=gtklevel9
pkgver=5.1
pkgrel=5
pkgdesc="An interpreter for British text adventures by Level 9."
arch=(i686 x86_64)
url="http://mirror.ifarchive.org/indexes/if-archiveXlevel9XinterpretersXlevel9.html"
license=('GPL')
depends=('gtk2')
source=("http://mirror.ifarchive.org/if-archive/level9/interpreters/level9/Level9_${pkgver}_Source.zip"
	gargoyle.patch gtklevel9.desktop gtklevel9.png)
md5sums=('bd8f8483d23a5da590c65b85882e86a0'
         '57df12cb8ff5fa80d2ac3f7aaefc1f2c'
         '8611e0ea83131a909395d2be3fd0fb22'
         '4eb964f974666388080af3bc8eaba9d8')

prepare() {
 patch -Np0 -i gargoyle.patch
}

build() {
 cd Gtk
 make
}

package() {
 install -D Gtk/gtklevel9 ${pkgdir}/usr/bin/gtklevel9
 ln -s /usr/bin/gtklevel9 ${pkgdir}/usr/bin/level9
 install -D -m644 Gtk/README ${pkgdir}/usr/share/level9/README
 cp level9.txt ${pkgdir}/usr/share/level9/
 cp Gtk/BUGS ${pkgdir}/usr/share/level9/
 install -D -m644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
 install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
