# Maintainer: xiota / aur.chaotic.cx
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="nm-tray"
pkgname="$_pkgname"
pkgver=0.5.0
pkgrel=1
pkgdesc='Simple Qt-based frontend for NetworkManager with icon in system tray'
arch=('x86_64')
url='https://github.com/palinek/nm-tray'
license=('GPL')

depends=(
  'networkmanager-qt'
)
makedepends=(
  'cmake'
  'qt5-tools'
)

if [ x"$pkgname" != x"$_pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")
fi

_pkgsrc="$pkgname-$pkgver"
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/palinek/nm-tray/archive/$pkgver.tar.gz"
)
sha256sums=(
  '3db9fdfcf274392f040ee2e7370be41aaae5d700277979f661718e6d893c5ff5'
)

build() {
  cd "$_pkgsrc"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DNM_TRAY_XDG_AUTOSTART_DIR="/etc/xdg/autostart"
  make
}

package() {
  #install -d "$pkgdir/usr/share/$_pkgname"

  cd "$_pkgsrc/build"
  make DESTDIR="$pkgdir" install

  cd ..
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
