# Maintainer: Jakob <grandchild@gmx.net>
# Contributor: Andrew Wong <andrew@wongdev.com>

_pkgname="freeglut"
pkgbase="$_pkgname-git"
pkgname=("$_pkgname-x11-git" "$_pkgname-wayland-git")
pkgver=3.6.0.r3.gb789505b
pkgrel=1
arch=('i686' 'x86_64')
url="https://freeglut.sourceforge.net/"
license=('MIT')
makedepends=('cmake' 'mesa' 'glu' 'wayland' 'libxxf86vm' 'git')
provides=('glut' 'freeglut' 'freeglut-git')
conflicts=('glut' 'freeglut' 'freeglut-git')
replaces=('freeglut-svn')
source=("git+https://github.com/FreeGLUTProject/freeglut")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_freeglut-x11-git() {
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

package_freeglut-wayland-git() {
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
