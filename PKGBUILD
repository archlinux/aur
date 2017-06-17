# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=vmpk
pkgname=${_pkgname}-svn
pkgver=20170416.474
pkgrel=1
pkgdesc="Virtual MIDI Piano Keyboard. (SVN version)"
arch=('x86_64' 'i686')
url="http://vmpk.sourceforge.net"
license=('GPL3')
depends=('drumstick' 'qt5-x11extras')
makedepends=('cmake' 'docbook-xsl' 'qt5-tools' 'libxkbcommon-x11' 'subversion')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd trunk
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

build() {
  cd trunk/desktop
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd trunk/desktop
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
