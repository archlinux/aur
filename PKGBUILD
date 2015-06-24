# Maintainer: fclad <fcladera at fcladera.com>
# Contributor: prettyvanilla <prettyvanilla at posteo.at>
# Contributor: vnoel <victor.noel at crazydwarves dot org>

_pkgname=kile
pkgname=kile-git
pkgver=v2.1.r361.g653a1b8
pkgrel=1
pkgdesc="A TeX/LaTeX frontend for KDE"
arch=('i686' 'x86_64')
url="http://kile.sourceforge.net/"
license=('GPL2')
depends=('kdebase-runtime' 'poppler-qt4' 'texlive-core' 'kdebase-katepart')
makedepends=('git' 'cmake' 'automoc4')
install=$pkgname.install
conflicts=('kile')
provides=('kile')
replaces=('kile-svn')
source=("git://anongit.kde.org/kile")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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

