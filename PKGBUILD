pkgname=srecord
pkgver=1.65.0
pkgrel=2
pkgdesc='The SRecord package is a collection of powerful tools for manipulating EPROM load files.'
arch=('x86_64')
license=('GPL3')
makedepends=('cmake' 'ghostscript' 'libgcrypt' 'doxygen' 'graphviz' 'psutils' 'git')
url='https://srecord.sourceforge.net'
source=("https://sourceforge.net/projects/srecord/files/srecord/${pkgver%.*}/${pkgname}-${pkgver}-Source.tar.gz")
sha256sums=('81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644')

build() {
  mkdir -p build
  cd build
  cmake "../${pkgname}-${pkgver}-Source" -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}/usr/lib/" -not -name liblib_srecord.a -not -type d -delete
}
