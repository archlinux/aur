# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: morpheusthewhite <zffromGerace@hotmail.it>

pkgname=ddd
pkgver=3.3.12
pkgrel=12
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger..."
arch=('x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL3' 'LGPL3')
depends=('gcc-libs' 'openmotif' 'libxaw')
optdepends=('gdb: to use the Gnu debugger' 
            'java-runtime-openjdk: to use the Java debugger' 
            'pydb: to use the Python debugger' 
            'perl: to use the Perl debugger')
source=(http://ftp.gnu.org/gnu/ddd/${pkgname}-${pkgver}.tar.gz{,.sig} ddd-3.3.12-gcc44.patch friends.patch)
sha1sums=('b91d2dfb1145af409138bd34517a898341724e56'
          'de155d812da6e11e55cc882292bb5c7b30bd31a1'
          '3d43c9d56347f248732b1d72f29c7bf799f03864'
          '4fcb220ed3f2b84b9f6a9090a7e147341ed98ee2')
validpgpkeys=('4B286694DE99D517AA8DFF2D6656C593E5158D1A')
  
prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/ddd-3.3.12-gcc44.patch"
  patch -p1 -i "${srcdir}/friends.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  LIBS+="-pthread" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 icons/ddd.xpm "${pkgdir}/usr/share/pixmaps/ddd.xpm"
}
