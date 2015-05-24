# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Joan Rieu <toto_pirate@hotmail.fr>

pkgname=roxterm-gtk2-git
pkgver=20130902
pkgrel=1
pkgdesc="Tabbed, VTE-based terminal emulator (GTK2 version)"
arch=('i686' 'x86_64')
url="http://roxterm.sourceforge.net"
license=('GPL3')
depends=('dbus-glib' 'vte' 'hicolor-icon-theme')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
provides=('roxterm')
conflicts=('roxterm' 'roxterm-git' 'roxterm-gtk2')
install=roxterm-gtk2-git.install

source=("git://git.code.sf.net/p/roxterm/code")
md5sums=('SKIP')

_gitname="code"

pkgver() {
  date -uI | sed s',-,,g'
}

build() {
  cd "$srcdir/$_gitname"
  python2 mscript.py configure --prefix=/usr --no-lock --disable-gtk3
  python2 mscript.py build --no-lock
}

package() {
  cd "$srcdir/$_gitname"
  python2 mscript.py install DESTDIR="$pkgdir/" --no-lock
} 
