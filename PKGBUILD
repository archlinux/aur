pkgname=sni-qt-patched-git
_pkgname=sni-qt
pkgver=r.
pkgrel=1
pkgdesc='Qt4 plugin which turns all QSystemTrayIcon into StatusNotifierItems. Hardcode-Tray version'
arch=('i686' 'x86_64')
url='https://github.com/bil-elmoussaoui/sni-qt'
license=('LGPL3')
depends=('libdbusmenu-qt4')
makedepends=('cmake' 'git')
backup=('etc/xdg/sni-qt.conf')
provides=('sni-qt-patched' 'sni-qt')
conflicts=('sni-qt-eplus' 'sni-qt')
source=("git://github.com/bil-elmoussaoui/sni-qt.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  if [ -d "build" ]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "$srcdir"/build
  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  # Install config file for apps that need "Activate" action
  install -Dm644 "${srcdir}/${_pkgname}/debian/sni-qt.conf" "${pkgdir}/etc/xdg/sni-qt.conf"
}