# Maintainer: Matt Robinson <aur@nerdoftheherd.com>
# Contributor: Matt Monaco <net 0x01b matt>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=xwiimote
pkgver=2
pkgrel=2
pkgdesc="Open Source Nintendo Wii Remote Linux Device Driver"
url="https://github.com/xwiimote/xwiimote"
arch=('x86_64')
license=('MIT')
depends=('libsystemd')
makedepends=('systemd')
conflicts=('xwiimote-git')
backup=('etc/X11/xorg.conf.d/50-fix-xwiimote.conf')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2e893e2899ec6c688df60092b6d88c911b45bc6ce9b4850030d72944873975cb')

prepare() {
  cd "$pkgname-$pkgname-$pkgver"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname-$pkgname-$pkgver"
  ./configure --prefix=/usr --with-doxygen=no
  make
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D "res/50-xorg-fix-xwiimote.conf" "$pkgdir/etc/X11/xorg.conf.d/50-fix-xwiimote.conf"
}
