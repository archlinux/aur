# Maintainer: 2ion <dev@2ion.de>
pkgname=ini-git
pkgver=r2.fa7665b
pkgrel=2
pkgdesc="Command line tool for examining the contents of INI files"
arch=('i686' 'x86_64')
url="https://github.com/2ion/ini"
license=('GPL3')
depends=('iniparser')
makedepends=('autoconf' 'automake' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('ini::git+https://github.com/2ion/ini.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  make DESTDIR="$pkgdir/" install-strip
}
