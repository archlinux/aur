# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>

pkgname=php-jsonreader-git
pkgver=r38.c829b3b
pkgrel=1
pkgdesc="A JSON pull-parser extension for PHP based on libvktor"
arch=("i686" "x86_64")
url="https://github.com/shevron/ext-jsonreader"
license=('PHP')
depends=("php")
source=("${pkgname}::git+https://github.com/shevron/ext-jsonreader.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  phpize
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make install INSTALL_ROOT="${pkgdir}"
}
