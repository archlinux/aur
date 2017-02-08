# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=hidclient
pkgver=20120728
pkgrel=2
epoch=
pkgdesc="Client program to transmit local keyboard events over bluetooth."
arch=('i686' 'x86_64')
url="http://anselm.hoffmeister.be/computer/hidclient/"
license=('GPL')
groups=()
depends=('bluez-libs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/$pkgname-$pkgver.tar.bz2"
	"0001-f10-escape.patch"
	"bluetooth-daemon-compat.conf")
md5sums=('70ca8cabf77dbe9b70ba62808942dc29'
         'c8b66710490670e33a1821b95b3b3c59'
         '62df889c8144db07f95e289dea97996f')
noextract=()

prepare() {
  cd "$srcdir/"
  patch -p1 < "$srcdir/0001-f10-escape.patch"
}

build() {
  cd "$srcdir/"
  make
}

package() {
  cd "$srcdir/"
  install -Dt "$pkgdir"/usr/bin hidclient
  install -Dt "$pkgdir"/usr/lib/systemd/system/bluetooth.service.d -m644 bluetooth-daemon-compat.conf
}

# vim:set ts=2 sw=2 et:
