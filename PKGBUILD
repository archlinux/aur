# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Pagnite <tymoteuszdolega at gmail dot com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Deon Spengler <deon@spengler.co.za>
pkgname=ddcutil-git
pkgver=1.2.0.r0.g52e170ee
pkgrel=1
pkgdesc="Query and change Linux monitor settings using DDC/CI and USB."
url="https://www.ddcutil.com"
arch=('x86_64')
license=('GPL2')
depends=('glib2' 'i2c-tools' 'kmod' 'libusb' 'libdrm' 'libxrandr' 'systemd-libs')
makedepends=('git' 'systemd')
provides=("${pkgname%-git}=${pkgver//.r*/}" 'libddcutil.so=4')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rockowitz/ddcutil.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
