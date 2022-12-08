# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-polkit-agent-git
pkgver=5.5.21.r7.g2f9964c
pkgrel=1
pkgdesc='Deepin Polkit Agent'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-polkit-agent"
license=('GPL3')
depends=('deepin-qt-dbus-factory-git' 'startdde-git' 'polkit-qt5' 'dtkwidget-git')
makedepends=('git' 'polkit-qt5' 'dtkcommon-git' 'dtkwidget-git' 'cmake' 'ninja')
conflicts=('deepin-polkit-agent')
provides=('deepin-polkit-agent')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-polkit-agent")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake . -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
