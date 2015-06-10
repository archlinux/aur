# Maintainer: Corelli <corelli AT yepmail DOT net>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: cmorlok <christianmorlok@web.de>

_pkgname=kbibtex
pkgname=kbibtex-git
pkgver=20150108_1fba709
pkgrel=1
pkgdesc="A BibTeX editor for KDE"
arch=('i686' 'x86_64')
url='http://home.gna.org/kbibtex/'
license=('GPL2')
depends=('kdebase-runtime')
optdepends=('kdegraphics-okular: Document preview')
makedepends=('git' 'cmake' 'automoc4')
install=$pkgname.install
provides=('kbibtex')
conflicts=('kbibtex')
replaces=('kbibtex-svn')
source=("git://anongit.kde.org/kbibtex")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g')_$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  [ -d build ] && rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir" install
}
