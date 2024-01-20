pkgname=deepin-application-manager-git
_pkgname=deepin-application-manager
sourcename=dde-application-manager
pkgver=1.1.7.r2.g95019a3
pkgrel=1
pkgdesc='App manager of Deepin Desktop Environment'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-application-manager"
license=('GPL3')
# deepin-wloutput-daemon: org.deepin.dde.KWayland1
# startdde: org.deepin.dde.XSettings1
depends=('qt6-base' 'glibc' 'gcc-libs' 'systemd-libs' 'deepin-wloutput-daemon' 'startdde')
makedepends=('cmake' 'ninja' 'gtest')
conflicts=($_pkgname)
provides=($_pkgname)
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-application-manager.git")
sha512sums=('SKIP')

pkgver() {
    cd $sourcename
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcename
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_INSTALL_LIBEXECDIR=lib
  ninja
}

package() {
  cd $sourcename
  DESTDIR="$pkgdir" ninja install
  rm -r "$pkgdir"/etc/dpkg
  rmdir "$pkgdir"/etc
}

