# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=eilin
pkgver=3.2
pkgrel=1
pkgdesc="Utility to control EIZO monitors under Linux"
arch=('i686' 'x86_64')
url="https://sourceforge.net/p/eilin/home/Home/"
license=('GPL3')
depends=('libusb' 'expat')
makedepends=('cmake' 'qt4')
optdepends=('qt4: system tray icon')
install=eilin.install
source=(http://downloads.sourceforge.net/project/eilin/$pkgname-$pkgver.tar.gz)
md5sums=('ba6449d2d522b6ff838c3604511a03f7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake . \
    -DINSTALL_SETUID=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # install the udev rule
  install -Dm644 51-eizo.rules "$pkgdir/usr/lib/udev/rules.d/51-eizo.rules"
}

# vim:set ts=2 sw=2 et:
