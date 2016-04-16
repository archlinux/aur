# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=speedcrunch-git
pkgver=20160416
pkgrel=2
pkgdesc="Simple, high precision and powerful calculator."
arch=('i686' 'x86_64')
url="http://speedcrunch.org/"
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'libxkbcommon-x11')
makedepends=('git' 'cmake' 
	     'python-sphinx' 'python-sphinx-quark-theme')	# required for REBUILD_MANUAL
conflicts=('speedcrunch')
provides=('speedcrunch')
source=('speedcrunch::git+https://bitbucket.org/heldercorreia/speedcrunch.git')
md5sums=('SKIP')

pkgver() {
  cd speedcrunch
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd speedcrunch
  rm -rf build
  mkdir build
  cd build
  cmake ../src -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DREBUILD_MANUAL=on
  make
}

package() {
  cd speedcrunch/build
  make install
}
