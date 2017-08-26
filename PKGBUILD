# Maintainer: Greg Erwin <first name last name 256 at gmail dot com>

pkgname=libgpiod-git
pkgver=r446.8ee026e
pkgrel=1
pkgdesc="C library and tools for interacting with the linux GPIO character device"
url="https://github.com/brgl/libgpiod"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('linux>=4.8')
makedepends=('git')
source=('git://github.com/brgl/libgpiod')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh
  ./configure --enable-tools=yes  --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
