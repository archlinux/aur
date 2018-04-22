# Maintainer: Yifei Wang <chrisww@live.com>

pkgname=shadowsocks-qt5-git
pkgver=3.0.0.r3.g8a97897
pkgrel=1
pkgdesc="A fast, reliable and cross-platform GUI fronted for Shadowsocks."
arch=('x86_64' 'i686')
url="https://github.com/shadowsocks/shadowsocks-qt5"
license=('GPL')
depends=('qrencode' 'libqtshadowsocks' 'zbar')
makedepends=('cmake' 'git')
provides=('shadowsocks-qt5')
conflicts=('shadowsocks-qt5')
source=('git+https://github.com/shadowsocks/shadowsocks-qt5')
sha512sums=('SKIP')

pkgver() {
  cd shadowsocks-qt5
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd shadowsocks-qt5

  # Disable appindicator (was needed for Qt < 5.4.2)
  sed -i '/APPINDICATOR/d' CMakeLists.txt
}

build() {
  cd shadowsocks-qt5
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd shadowsocks-qt5
  make DESTDIR="$pkgdir" install
}
