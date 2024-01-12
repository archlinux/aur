# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=deepin-launchpad-git
pkgver=0.4.1.r11.g7fbbf96
pkgrel=1
sourcename=dde-launchpad
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='Deepin desktop-environment - Launchpad module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-launchpad"
license=('GPL3')
depends=('qt5-svg'
         'qt5-quickcontrols'
         'appstream-qt'
         'dtkdeclarative-git'
         'dtkgui-git'
         'qt5-base'
         'qt5-x11extras'
         'qt5-svg'
)
makedepends=('git' 'cmake' 'ninja' 'qt5-tools' 'dtkdeclarative-git' 'dtkgui-git')
conflicts=('deepin-launcher')
provides=('deepin-launchpad')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd $sourcedir
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcedir
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd $sourcedir
  DESTDIR="$pkgdir" ninja install
}
