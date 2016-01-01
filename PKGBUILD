# Maintainer: Corelli <corelli AT yepmail DOT net>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: cmorlok <christianmorlok@web.de>

_pkgname=kbibtex
pkgname=kbibtex-git
pkgver=20151231_728bcdf
pkgrel=1
pkgdesc="A BibTeX editor for KDE"
arch=('i686' 'x86_64')
url='http://home.gna.org/kbibtex/'
license=('GPL2')
depends=('plasma-framework' 'poppler-qt5' 'qca-qt5')
optdepends=('kdegraphics-okular: Document preview')
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
install=$pkgname.install
provides=('kbibtex')
conflicts=('kbibtex')
replaces=('kbibtex-svn')
source=("git://anongit.kde.org/kbibtex#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g')_$(git rev-parse --short HEAD)"
}

prepare() {
mkdir -p build
  }

build() { 
  cd build
  cmake ../$_pkgname  \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}


package() {
  cd build
  make DESTDIR="$pkgdir" install
}