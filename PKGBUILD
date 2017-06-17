# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=drumstick
pkgname=${_pkgname}-svn
pkgver=20170510.341
pkgrel=1
pkgdesc="MIDI libraries for Qt5/C++. (SVN version)"
arch=('x86_64' 'i686')
url="http://drumstick.sourceforge.net"
license=('GPL')
depends=('fluidsynth' 'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info' 'qt5-svg')
makedepends=('cmake' 'doxygen' 'docbook-xsl' 'subversion')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd trunk
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

build() {
  cd trunk
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=release \
          -DLIB_SUFFIX=
  make
}

package() {
  cd trunk
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
