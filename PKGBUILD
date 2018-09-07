# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Fredrik Haikarainen <fredrik.haikarainen@gmail.com>

pkgname=light-git
pkgver=1.1.2.r67.g1be06a4
pkgrel=1
pkgdesc='Program to easily change brightness on backlight-controllers.'
arch=('i686' 'x86_64')
url="https://github.com/haikarainen/light"
license=('GPL3')
makedepends=('git')
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
  ./configure --prefix=/usr
  make
}

package(){
  cd "$srcdir/light"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
