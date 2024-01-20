pkgname=deepin-wloutput-daemon-git
sourcename=dde-wloutput-daemon
pkgver=2.0.3
pkgrel=1
pkgdesc='Daemon for display settings in the DDE KWayland desktop environment'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-wloutput-daemon"
license=('GPL3')
depends=('qt5-base' 'dwayland' 'dtkcore' 'glibc' 'gcc-libs')
makedepends=('cmake' 'ninja' 'extra-cmake-modules')
provides=('deepin-wloutput-daemon')
conflicts=('deepin-wloutput-daemon')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-wloutput-daemon")
sha512sums=('SKIP')

prepare() {
  cd $sourcename
  sed -i 's/DtkGui/DtkCore/' src/CMakeLists.txt
}

build() {
  cd $sourcename
  cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $sourcename/build
  DESTDIR="$pkgdir" ninja install
}
