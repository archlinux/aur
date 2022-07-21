# Maintainer: Jakob <grandchild@gmx.net>
# Contributor: Andrew Wong <andrew@wongdev.com>

_pkgname="freeglut"
pkgbase="$_pkgname-svn"
pkgname=("$_pkgname-x11-svn" "$_pkgname-wayland-svn")
pkgver=r1877
pkgrel=2
arch=('i686' 'x86_64')
url="http://freeglut.sourceforge.net/"
license=('MIT')
makedepends=('subversion' 'cmake' 'mesa' 'glu' 'wayland' 'libxxf86vm')
provides=('glut' 'freeglut' 'freeglut-svn')
conflicts=('glut' 'freeglut' 'freeglut-svn')
source=("svn+https://svn.code.sf.net/p/freeglut/code/trunk/freeglut/freeglut")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  echo "r${ver//[[:alpha:]]}"
}

package_freeglut-x11-svn() {
  depends=('libxi' 'libxrandr' 'libgl')
  pkgdesc="Provides functionality for small OpenGL programs - X11 version"

  cmake -S $_pkgname -B build-x11 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DFREEGLUT_BUILD_DEMOS=OFF
  cmake --build build-x11
  DESTDIR="$pkgdir" cmake --install build-x11
  install -Dm644 $_pkgname/COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

package_freeglut-wayland-svn() {
  depends=('wayland' 'libxkbcommon' 'libgl')
  pkgdesc="Provides functionality for small OpenGL programs - Wayland version"

  cmake -S $_pkgname -B build-wayland \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DFREEGLUT_BUILD_DEMOS=OFF
  cmake --build build-wayland
  DESTDIR="$pkgdir" cmake --install build-wayland
  install -Dm644 $_pkgname/COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
