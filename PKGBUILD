# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com
# Contributor: Thermionix <thermionix at gmail dot com>

pkgname=navit
pkgver=0.5.0_rc.1
pkgrel=1
pkgdesc="A modular turn-by-turn car navigation system"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.navit-project.org/"
license=('GPL')
depends=('glu' 'freeglut' 'dbus-glib' 'cairo' 'imlib2' 'sdl_image' 'gtk2' 'gpsd' 'postgresql-libs')
optdepends=('cegui>=0.5.0: OpenGL gui' 'quesoglc: OpenGL gui')
makedepends=('cmake')
options=('!libtool')
install=navit.install
source=(http://downloads.sourceforge.net/$pkgname/v${pkgver/_/-}.tar.gz)
md5sums=('cb6ee913eea1fa06c90852e1dfbdcb94')

build() {
  cd "$srcdir/navit-gps-navit"*
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_LIBDIR=lib \
    -Dgraphics/opengl=TRUE \
    -DSAMPLE_MAP=FALSE 
  make
}

package() {
  cd "$srcdir/navit-gps-navit"*
  make DESTDIR=${pkgdir} install
}

