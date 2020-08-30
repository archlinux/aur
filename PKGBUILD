# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=unfuckify-git
pkgver=r43.0606142
pkgrel=1
pkgdesc='Makes c++ code using `auto` readable, i. e. unfucks it'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/unfuckify'
license=('LGPL')
depends=('clang')
makedepends=('git' 'llvm' 'cmake')
conflicts=(unfuckify)
provides=(unfuckify)
source=('git://github.com/sandsmark/unfuckify.git')
md5sums=('SKIP')

pkgver() {
  cd unfuckify
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd unfuckify
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd unfuckify
  make DESTDIR="$pkgdir" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
