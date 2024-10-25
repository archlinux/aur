# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dde-shell-git
_pkgname=dde-shell
pkgver=0.0.43.r81.gb3f342c0
pkgrel=1
pkgdesc='New DDE shell'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-shell"
license=('LGPL3')
depends=('dtk6declarative'
         'qt5-wayland'
         'qt6-wayland'
         'dtkgui'
         'dtkwidget'
         'deepin-tray-loader'
)
makedepends=('git'
             'qt6-tools'
             'qt5-tools'
             'dtk6declarative'
             'qt5-wayland'
             'qt6-wayland'
             'dtkgui'
             'dtkwidget'
             'cmake'
             'ninja'
             'deepin-tray-loader'
             'deepin-application-manager'
             'treeland-protocols'
)
conflicts=('dde-shell' 'deepin-shell')
provides=('dde-shell' 'deepin-shell')
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
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
