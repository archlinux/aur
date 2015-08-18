# Maintainer: 2ion <dev@2ion.de>
pkgname=uchardet-git
pkgver=r28.84e292d
pkgrel=1
pkgdesc="An encoding detector library ported from Mozilla"
arch=('i686' 'x86_64')
url="https://github.com/BYVoid/uchardet"
license=('MPL')
depends=('gcc-libs')
makedepends=('git' 'gcc' 'cmake' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('uchardet::git+https://github.com/BYVoid/uchardet.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
