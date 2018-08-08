# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Fredrik Haikarainen <fredrik.haikarainen@gmail.com>

pkgname=light-git
pkgver=1.1.2.r22.g5d5e3c3
pkgrel=1
pkgdesc='Program to easily change brightness on backlight-controllers.'
arch=('i686' 'x86_64')
url="https://github.com/haikarainen/light"
license=('GPL3')
makedepends=('git' 'help2man')
conflicts=('light')
provides=('light')
source=('git+https://github.com/haikarainen/light.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/light"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/light"
  ./autogen.sh
  ./configure
  make
}

package(){
  cd "$srcdir/light"
  make DESTDIR="$pkgdir/" install
}
