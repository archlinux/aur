# Maintainer: takiz <tacidd@gmail.com>

pkgname=roxterm-gtk2-patched
pkgver=2.8.1
pkgrel=1
pkgdesc='Tabbed, VTE-based terminal emulator (GTK2 version)'
arch=('i686' 'x86_64')
url='http://roxterm.sourceforge.net/'
license=('GPL3')
depends=('dbus-glib' 'vte' 'hicolor-icon-theme' 'libsm')
makedepends=('docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg')
source=("http://downloads.sourceforge.net/roxterm/roxterm-$pkgver.tar.bz2")
sha256sums=('b8b9660917c6a036d71a55b841143b8e9291a12e8f5748a2406c2d1ba5879b04')

build() {
  cd "${srcdir}/roxterm-${pkgver}"

  patch -Np1 -i "../../roxterm_gtk2.patch"
  python2 mscript.py configure --prefix='/usr' --disable-gtk3 --disable-sm
  python2 mscript.py build
}

package() {
  cd "${srcdir}/roxterm-${pkgver}"
  python2 mscript.py install --destdir="${pkgdir}"
}
