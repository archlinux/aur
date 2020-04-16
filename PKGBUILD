# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: fclad <fcladera at fcladera.com>
# Contributor: Antonio Rojas
# Contributor: prettyvanilla <prettyvanilla at posteo.at>
# Contributor: vnoel <victor.noel at crazydwarves dot org>

_pkgname=kile
pkgname=kile-git
pkgver=v3.0b2.r90.g5b83c2a0
pkgrel=1
pkgdesc="A TeX/LaTeX frontend for KDE"
arch=('i686' 'x86_64')
url="http://kile.sourceforge.net/"
license=('GPL2')
depends=('kinit' 'texlive-core' 'okular>16.12.0' 'ktexteditor' 'khtml')
makedepends=('git' 'extra-cmake-modules' 'kdoctools' 'python')
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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir" install
}

