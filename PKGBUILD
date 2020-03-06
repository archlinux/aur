# Maintainer: Filip Parag <aur@filiparag.com>
# Maintainer: Bojan Stipić <bojanstipic@uns.ac.rs>

pkgname=ddd-ftn
pkgver=3.3.12
pkgrel=13
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger adapted for use at Faculty of Technical Sciences, University of Novi Sad"
arch=('x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL3' 'LGPL3')
depends=('gcc-libs' 'openmotif' 'libxaw')
optdepends=('gdb: to use the Gnu debugger'
            'java-runtime-openjdk: to use the Java debugger'
            'pydb: to use the Python debugger'
            'perl: to use the Perl debugger')
source=(http://ftp.gnu.org/gnu/ddd/ddd-${pkgver}.tar.gz ddd-3.3.12-gcc44.patch friend-default.patch tmd018)
sha1sums=('b91d2dfb1145af409138bd34517a898341724e56'
          '3d43c9d56347f248732b1d72f29c7bf799f03864'
          '4fcb220ed3f2b84b9f6a9090a7e147341ed98ee2'
          '8b05f6f2ec483792ca9e910840e36ad2e0ef1c79')

prepare() {
  cd ddd-${pkgver}
  patch -p1 -i "${srcdir}/ddd-3.3.12-gcc44.patch"
  patch -p1 -i "${srcdir}/friend-default.patch"
  patch -p1 -i "${srcdir}/tmd018"
}

build() {
  cd ddd-${pkgver}
  LIBS+="-pthread" ./configure --prefix=/usr
  make -j$(nproc)
}

package() {
  cd ddd-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 icons/ddd.xpm "${pkgdir}/usr/share/pixmaps/ddd.xpm"
}
