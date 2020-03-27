# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tony Houghton <h@realh.co.uk>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Joan Rieu <toto_pirate@hotmail.fr>

pkgname=roxterm-git
pkgver=3.8.5.r0.gf7bc346
pkgrel=1
pkgdesc="Tabbed, VTE-based terminal emulator"
epoch=1
arch=('i686' 'x86_64')
url="http://roxterm.sourceforge.net"
license=('GPL3')
depends=('dbus-glib' 'vte3' 'libsm')
makedepends=('git' 'docbook-xsl' 'xmlto' 'po4a' 'python2' 'python2-lockfile' 'imagemagick' 'librsvg' 'itstool')
provides=('roxterm')
conflicts=('roxterm')
source=("$pkgname::git+https://github.com/realh/roxterm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DCMAKE_SKIP_RPATH='TRUE' 
  make
}

package() {
  cd $pkgname
  make -C build DESTDIR="${pkgdir}" install
} 

# vim:set ts=2 sw=2 et:
