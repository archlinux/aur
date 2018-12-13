# Maintainer: loh.tar <loh.tar at googlemail dot com>
# Thanks to kate-latex-plugin.git which was my starting point for this PKGBUILD
pkgname="kate-indexview-plugin"
_pkgname="KatePlugin-IndexView"
pkgver="0.8.3"
pkgrel="1"
pkgdesc="A fork from Kate's SymbolViewer plugin with a couple of improvements"
arch=("i686" "x86_64")
url="https://github.com/loh-tar/$_pkgname"
license=("LGPL")
depends=("kate")
makedepends=("cmake" "extra-cmake-modules")
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('343fb49a0b1220b6a8bdfbebaf865941')

build()
{
  if [[ -d ${srcdir}/build ]]; then
    rm -rf "$srcdir/build"
  fi
  mkdir "$srcdir/build"; cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        ../"$_pkgname-$pkgver"/
  make
}

package()
{
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
