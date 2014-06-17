# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Joan Rieu <toto_pirate@hotmail.fr>

pkgname=roxterm-git
pkgver=2.9.0.r10.g4415109
pkgrel=1
pkgdesc="Tabbed, VTE-based terminal emulator"
epoch=1
arch=('i686' 'x86_64')
url="http://roxterm.sourceforge.net"
license=('GPL3')
depends=('dbus-glib' 'vte3' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
provides=('roxterm')
conflicts=('roxterm')
install=roxterm.install
source=("$pkgname::git://git.code.sf.net/p/roxterm/code")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname
  # FS#38967: Reenable deprecated VTE3 functions
  python2 mscript.py configure --prefix='/usr' \
      --enable-deprecated-bg-opts
  python2 mscript.py build
}

package() {
  cd $pkgname
  python2 mscript.py install --destdir="${pkgdir}"
} 

# vim:set ts=2 sw=2 et:
