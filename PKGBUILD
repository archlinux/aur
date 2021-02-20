# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Coenraad van der Westhuizen <chwesthuizen@gmail.com>
# Contributor: hm_b <holger (at) music-nerds (dot) net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=canorus
pkgver=0.7.3rc3
pkgrel=4
pkgdesc="A free music score editor"
arch=('x86_64')
url="http://www.canorus.org/"
license=('GPL')
depends=('qt5-svg' 'qt5-webengine' 'alsa-lib' 'zlib' 'python')
makedepends=('cmake' 'swig' 'qt5-tools' 'ruby')
source=("https://downloads.sourceforge.net/project/canorus/0.7.3/canorus-${pkgver}.tar.bz2")
sha256sums=('c5d470ac6cae696472dcb7176e0cd4545b883ff84ae2dc767a8956546f5b4b15')

build() {
  cd $pkgname-$pkgver
  # stringop-truncation will be fixes in swig, see https://github.com/swig/swig/issues/893
  export CXXFLAGS+=" -Wno-misleading-indentation -Wno-dangling-else -Wno-stringop-truncation -Wno-deprecated -Wno-deprecated-declarations"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
	-DDEFAULT_DATA_DIR="/usr/share/canorus"
}

package() {
  cd $pkgname-$pkgver
  make install
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  cp canorus.desktop "$pkgdir"/usr/share/applications
  cp "$pkgdir"/usr/share/{canorus/images/clogosm.png,pixmaps/canorus.png}
}
