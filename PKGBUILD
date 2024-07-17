# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dde-tray-loader-git
_pkgname=dde-tray-loader
pkgver=0.0.1.r3.g14906d5
pkgrel=1
pkgdesc='The dde-tray-loader project provides a set of tray plugins that integrated into task bar and the tool loader which can load the plugins.'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-tray-loader"
license=('LGPL3')
depends=('dtk6declarative'
         'qt5-wayland'
         'qt6-wayland'
         'dtkgui'
         'dtkwidget'
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
)
conflicts=('deepin-tray-loader')
provides=('deepin-tray-loader')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-tray-loader.git")
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
