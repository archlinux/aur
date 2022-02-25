# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-polkit-agent-git
pkgver=5.5.3.r10.g0def9c0
pkgrel=1
pkgdesc='Deepin Polkit Agent'
arch=('aarch64')
url="https://github.com/linuxdeepin/dde-polkit-agent"
license=('GPL3')
depends=('deepin-qt-dbus-factory-git' 'startdde-git' 'polkit-qt5' 'dtkwidget-git')
makedepends=('git' 'polkit-qt5' 'dtkcommon-git' 'dtkwidget-git' 'cmake' 'ninja')
conflicts=('deepin-polkit-agent')
provides=('deepin-polkit-agent')
groups=('deepin-git')
source=("$pkgname::git://github.com/linuxdeepin/dde-polkit-agent"
        "fix.patch")
sha512sums=('SKIP'
            'b02235cece90a01942cd0898cfb85c7eb8fa6f980c4e1d83cfa115baba1599ca878788b5d89338444afe8267c30b11f9279ebda98d3bbc3dd4f3fe03cd1f0572')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -p1 -i ../fix.patch
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
