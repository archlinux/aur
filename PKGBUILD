# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dde-shell-git
_pkgname=dde-shell
pkgver=0.0.4.r3.g1e88b2d
pkgrel=1
pkgdesc='New DDE shell'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-shell"
license=('LGPL3')
depends=('dtk6declarative-git'
         'qt5-wayland'
         'qt6-wayland'
         'dtkgui-git'
         'dtkwidget-git'
)
makedepends=('git'
             'qt6-tools'
             'qt5-tools'
             'dtk6declarative-git'
             'qt5-wayland'
             'qt6-wayland'
             'dtkgui-git'
             'dtkwidget-git'
             'cmake'
             'ninja'
)
conflicts=('dde-shell')
provides=('dde-shell')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-shell.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
