# Maintainer: Orestis Floros <orestisflo@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Pagnite <tymoteuszdolega at gmail dot com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Deon Spengler <deon@spengler.co.za>
_name=ddcutil
pkgname="$_name-dev-git"
pkgver=1.4.1.r343.g5f6ded70
pkgrel=1
pkgdesc="Query and change Linux monitor settings using DDC/CI and USB."
url="https://www.ddcutil.com"
arch=('x86_64')
license=('GPL2')
depends=('glib2' 'i2c-tools' 'libusb' 'libdrm' 'libxrandr')
makedepends=('git' 'systemd')
provides=("$_name" 'libddcutil.so=4')
conflicts=("$_name")
source=('git+https://github.com/rockowitz/ddcutil.git#branch=1.5.0-dev')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_name"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$_name"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir" install
}
