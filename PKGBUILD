# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=hidclient
pkgver=20120728
pkgrel=3
epoch=
pkgdesc="Client program to transmit local keyboard events over bluetooth."
arch=('i686' 'x86_64')
url="https://github.com/kcolford/hidclient"
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
source=("$url/archive/$pkgver.tar.gz"
	"0001-f10-escape.patch"
	"bluetooth-daemon-compat.conf")
md5sums=('7b4cef8d78af5c1290ed1552b28b052f'
         'c8b66710490670e33a1821b95b3b3c59'
         '62df889c8144db07f95e289dea97996f')
noextract=()

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < "$srcdir/0001-f10-escape.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dt "$pkgdir"/usr/lib/systemd/system/bluetooth.service.d -m644 bluetooth-daemon-compat.conf
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir"/usr/bin hidclient
}

# vim:set ts=2 sw=2 et:
