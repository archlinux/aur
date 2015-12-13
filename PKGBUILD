# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Maintainer: <kontakt.zuf [at] gmail.com>
# Maintainer: Eric Bélanger <eric [at] archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky [at] gmail.com>

pkgname=geeqie-lirc
pkgver=1.2.2
pkgrel=2
pkgdesc="A lightweight image browser and viewer with remote (LIRC) support"
arch=('i686' 'x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('exiv2' 'gtk2' 'lcms2' 'lua51' 'lirc' 'desktop-file-utils')
makedepends=('intltool' 'doxygen' 'gnome-doc-utils' 'git')
optdepends=('librsvg: SVG rendering'
	    'fbida: for jpeg rotation'
	    'exiv2: for tiff and png rotation')
conflicts=('geeqie' 'geeqie-git')
provides=('geeqie')
install=geeqie.install
source=(http://www.geeqie.org/geeqie-${pkgver}.tar.xz
        fix-fullscreen.patch)
sha1sums=('9dd094707d7bf7389eb62a218ff7bc86339fc995'
          'dab15bbda9b329f663276b25bf1989b410596644')

prepare() {
  cd "${srcdir}/geeqie-${pkgver}"
  patch -p1 -i ../fix-fullscreen.patch
}

build() {
  cd "${srcdir}/geeqie-${pkgver}"
  ./configure --prefix=/usr --enable-lirc
  make
}

package(){
  cd "${srcdir}/geeqie-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
