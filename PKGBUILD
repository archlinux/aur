# Maintainter: thr <r at sledinmay dot com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=gtklevel9
pkgver=5.1
pkgrel=3
pkgdesc="An interpreter for games from the British text adventure company Level 9."
arch=(i686 x86_64)
url="http://mirror.ifarchive.org/indexes/if-archiveXlevel9XinterpretersXlevel9.html"
license=('GPL')
depends=('gtk2')
source=("http://mirror.ifarchive.org/if-archive/level9/interpreters/level9/Level9_${pkgver}_Source.zip"
	gargoyle.patch glibc.patch gtklevel9.desktop gtklevel9.png)
md5sums=('7566e9b527a22164bf91c02b44a2bc81'
         '57df12cb8ff5fa80d2ac3f7aaefc1f2c'
         '1f26eaa8a885e651620ff3fae18e7816'
         '8611e0ea83131a909395d2be3fd0fb22'
         '4eb964f974666388080af3bc8eaba9d8')

build() {
  patch -Np0 -i $srcdir/gargoyle.patch
  patch -Np0 -i $srcdir/glibc.patch

  cd $srcdir/Gtk
  make || return 1
}

package() {
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/level9

  install -D Gtk/README $pkgdir/usr/share/level9/
  install -D Gtk/BUGS $pkgdir/usr/share/level9/
  install -D $srcdir/level9.txt $pkgdir/usr/share/level9/
  install -D $srcdir/../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D Gtk/gtklevel9 $pkgdir/usr/bin/
  ln -s /usr/bin/gtklevel9 $pkgdir/usr/bin/level9
}
