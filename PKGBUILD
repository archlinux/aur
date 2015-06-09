# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=speedcrunch-git
pkgver=20141119
pkgrel=1
pkgdesc="Simple, high precision and powerful calculator."
arch=('i686' 'x86_64')
url="http://speedcrunch.org/"
license=('GPL2')
depends=('qt5-base' 'libxkbcommon-x11')
makedepends=('git')
conflicts=('speedcrunch')
provides=('speedcrunch')
source=('speedcrunch::git+https://github.com/speedcrunch/SpeedCrunch.git')
md5sums=('SKIP')

pkgver() {
  cd speedcrunch
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd speedcrunch/src/
  qmake-qt5 speedcrunch.pro
  make
}

package() {
  cd speedcrunch/src/
  make INSTALL_ROOT="$pkgdir/usr" install
}
