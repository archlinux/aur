# Maintainer: Corelli <corelli AT yepmail DOT net>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: cmorlok <christianmorlok@web.de>

_pkgname=kbibtex
pkgname=kbibtex-git
pkgver=20160618_4349a09
pkgrel=1
pkgdesc="A BibTeX editor for KDE"
arch=('i686' 'x86_64')
url='http://home.gna.org/kbibtex/'
license=('GPL2')
depends=('kparts' 'poppler-qt5' 'qca-qt5')   
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
provides=('kbibtex')
conflicts=('kbibtex')
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
