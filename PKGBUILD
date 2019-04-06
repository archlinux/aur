# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive-git
_pkgname=olive
pkgver=continuous.r0.g6264123b
_commit=6264123
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'git')
optdepends=('frei0r-plugins' 'olive-community-effects-git')
conflicts=('olive')
source=("git+https://github.com/olive-editor/olive#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [ -d "$srcdir/build" ]
  then
    rm -rf "$srcdir/build"
  fi

  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
