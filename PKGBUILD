# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: fclad <fcladera at fcladera.com>
# Contributor: Antonio Rojas
# Contributor: prettyvanilla <prettyvanilla at posteo.at>
# Contributor: vnoel <victor.noel at crazydwarves dot org>

_pkgname=kile
pkgname=kile-git
pkgver=v3.0b2.r432.gbc174ca6
pkgrel=1
pkgdesc="A TeX/LaTeX frontend for KDE"
arch=('i686' 'x86_64')
url="http://kile.sourceforge.net/"
license=('GPL2')
depends=('kinit' 'texlive-core' 'okular>16.12.0' 'ktexteditor5' 'khtml' 'qt5-script')
makedepends=('git' 'extra-cmake-modules' 'kdoctools5' 'python')
conflicts=('kile')
provides=('kile')
replaces=('kile-svn')
source=("kile::git+https://invent.kde.org/office/kile")
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

