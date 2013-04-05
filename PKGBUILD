# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libcec-git
epoch=1
pkgver=2.0.4.77.g3ff78be
pkgrel=1
pkgdesc="Pulse-Eight's libcec for the Pulse-Eight USB-CEC adapter"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/libcec"
license=('GPL')
makedepends=('git')
depends=('udev>=151' 'lockdev')
provides=('libcec')
conflicts=('libcec')
options=('!libtool')
source=('libcec::git+https://github.com/Pulse-Eight/libcec.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/libcec
  git describe --tags | sed 's|libcec-||;s|-|.|g'
}

build() {
  cd "$srcdir"/libcec

  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/libcec
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
