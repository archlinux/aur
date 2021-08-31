# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Benoit Landrieu (ben@gresille.org)
# Maintainer: Benoit Landrieu (ben@gresille.org)

pkgname=scribus-stable
pkgver=1.4.8
pkgbase=scribus-stable
pkgrel=1
pkgdesc="Desktop publishing program - old stable version"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.scribus.net"
depends=('hunspell' 'podofo' 'libcups' 'python' 'python2' 'cairo' 'desktop-file-utils'
     'qt4' 'hyphen')
makedepends=('cmake')
optdepends=('lib2geom: for mesh distortion')
conflicts=('scribus')
provides=('scribus-stable')
source=("https://netix.dl.sourceforge.net/project/scribus/scribus/1.4.8/scribus-1.4.8.tar.gz")
md5sums=('6246cadc3d0a6dfc0119926eb7e7dcda')
options=('!emptydirs')

build() {
  cd "${pkgname%-stable}-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_DATAROOTDIR:PATH=/usr/share \
    -DCMAKE_LIBRARY_PATH:PATH=/usr/lib \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=FALSE .
  make
}

package() {
  cd "${pkgname%-stable}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
