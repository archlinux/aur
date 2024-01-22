# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=deepin-launchpad-git
pkgver=0.4.4.r1.g88ff096
pkgrel=1
sourcename=dde-launchpad
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='Deepin desktop-environment - Launchpad module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-launchpad"
license=('GPL3')
depends=('qt6-svg'
         'qt6-declarative'
         'appstream-qt'
         'dtk6declarative'
         'dtk6gui'
)
makedepends=('git' 'cmake' 'ninja' 'qt6-tools')
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
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DPREFER_QT_5=OFF
  ninja
}

package() {
  cd $sourcedir
  DESTDIR="$pkgdir" ninja install
}
