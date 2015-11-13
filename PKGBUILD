# Maintainer: Vladimir Cerny <blackvladimir@gmail.com>
pkgname=kicadlibrarian
pkgver=1.1.5365
pkgrel=1
pkgdesc="A utility to manage and maintain KiCad libraries with schematic symbols and footprints"
arch=('i686' 'x86_64')
url="http://www.compuphase.com/electronics/kicadlibrarian_en.htm"
license=('GPL')
depends=(desktop-file-utils gcc-libs-multilib wxgtk curl libharu)
source=("http://www.compuphase.com/software/kicadlibrarian-sources.tar.gz")
md5sums=('ab946069d91550da9a47acec602b675c')

build() {
  cd "$srcdir/$pkgname-${pkgver}/src"
  sed -ie "s#/usr/share/#${pkgdir}/usr/share/#" CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/opt/kicadlibrarian
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver}/src"
  cp ../kicadlibrarian.desktop .
  cp ../kicadlibrarian.xml .
  cp ../kicadlibrarian32.png .
  make install
  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/kicadlibrarian/bin/kicadlibrarian $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
