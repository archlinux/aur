# Maintainer: Jan Koppe <post@jankoppe.de>

pkgname=libvisca
pkgver=1.1.0
pkgrel=2
pkgdesc='library for controlling VISCA compliant cameras through a RS232 port of your PC.'
arch=('x86_64')
url='http://damien.douxchamps.net/libvisca/'
license=('LGPL')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download")
md5sums=('98a2ee940091dcf25c9af89e55518890')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr LDFLAGS='-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

