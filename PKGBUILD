# Maintainer: Yichao Yu <yyc1992@gmail.com>

pkgname=qtcurve-git
_realver=1.8.18
pkgver=1.8.18.293.ga249871e
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk.'
arch=('i686' 'x86_64')
url="https://github.com/QtCurve/qtcurve"
license=('GPL')
groups=('qtcurve')
depends=('qt5-base' 'qt5-svg' 'libxcb' 'qt5-x11extras'
  'gtk2' 'libx11' 'gcc-libs')
makedepends=('cmake' 'automoc4' 'git')
provides=(
  "qtcurve-utils=${_realver}"
  "qtcurve-gtk2=${_realver}"
  "qtcurve-kde4=${_realver}"
  "qtcurve-qt4=${_realver}"
  "qtcurve-qt5=${_realver}"
  "qtcurve-utils-git"
  "qtcurve-gtk2-git"
  "qtcurve-kde4-git"
  "qtcurve-qt4-git"
  "qtcurve-qt5-git")
conflicts=("qtcurve-kde4" "qtcurve-qt4"
  "qtcurve-qt5" "qtcurve-gtk2" "qtcurve-utils")
options=('!debug' 'strip')
source=(git://anongit.kde.org/qtcurve.git)
_gitname=qtcurve

pkgver() {
  cd "$srcdir/$_gitname"

  git describe | sed -e 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQTC_KDE4_PREFIX=/usr \
   -DQTC_QT4_ENABLE_KDE:BOOL="0" \
   -DQTC_QT4_STYLE_SUPPORT:BOOL="0" 
  make
}

package() {
  cd "$srcdir/$_gitname/build"

  make DESTDIR="$pkgdir/" install
}
sha512sums=('SKIP')
