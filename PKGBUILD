# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: morpheusthewhite <zffromGerace@hotmail.it>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=ddd
pkgver=3.4.1
pkgrel=2
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger..."
arch=('x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=('gcc-libs' 'openmotif' 'libxaw' 'libxt' 'libxft' 'libxmu' 'fontconfig' 'glibc' 'libx11' 'libxpm' 'ncurses')
optdepends=('gdb: to use the Gnu debugger' 
        'java-runtime-openjdk: to use the Java debugger' 
        'perl: to use the Perl debugger')
source=(https://ftp.gnu.org/gnu/ddd/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b87517a6c3f9611566347e283a2cf931fa369919b553536a2235e63402f4ee89')
prepare() {
  cd ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  LIBS+="-pthread" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 ddd/ddd.desktop "${pkgdir}/usr/share/applications/ddd.desktop"
}
