# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Joan Rieu <toto_pirate@hotmail.fr>

pkgname=roxterm-gtk2-git
pkgver=2.9.0.r10.g4415109
pkgrel=1
pkgdesc="Tabbed, VTE-based terminal emulator (GTK2 version)"
arch=('i686' 'x86_64')
url="http://roxterm.sourceforge.net"
license=('GPL3')
depends=('dbus-glib' 'vte' 'libsm')
makedepends=('git' 'docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
provides=('roxterm')
conflicts=('roxterm' 'roxterm-git' 'roxterm-gtk2')
install=roxterm-gtk2-git.install
source=("$pkgname::git://git.code.sf.net/p/roxterm/code")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname
  python2 mscript.py configure --prefix=/usr --disable-gtk3
  python2 mscript.py build
}

package() {
  cd $pkgname
  python2 mscript.py install --destdir="${pkgdir}"
  for s in 16 20 32 48 64; do
    install -d "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps"
    rsvg-convert -a -w $s -h $s -f png \
       "$pkgdir/usr/share/icons/hicolor/scalable/apps/roxterm.svg" \
      >"$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/roxterm.png"
  done
} 

# vim:set ts=2 sw=2 et:
