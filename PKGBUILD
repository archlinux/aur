# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

_pkgname=libg15
pkgname=$_pkgname-git
pkgver=3.0.7.r5.c40b91b6
pkgrel=3
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="https://gitlab.com/menelkir/$_pkgname"
license=('GPL')
depends=('libusb')
conflicts=('libg15')
provides=('libg15')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
