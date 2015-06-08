# Maintainer: 2ion <dev@2ion.de>
pkgname=forecast-git
pkgver=0.3.1
pkgrel=1
pkgdesc="Query weather forecasts from forecast.io"
arch=('i686' 'x86_64')
url="https://github.com/2ion/forecast"
license=('GPL3')
depends=('json-c' 'curl' 'libconfig' 'ncurses')
makedepends=('autoconf' 'automake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('forecast::git+https://github.com/2ion/forecast.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags | sed 's/-/.r/;s/-/./')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -f -i -s
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make -k check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
