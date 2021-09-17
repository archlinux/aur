# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=qeh-git
pkgver=r13.3f82632
pkgrel=1
pkgdesc='Very simple and fast image viewer'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/qeh'
license=('GPL')
depends=('qt5-base')
conflicts=(qeh)
provides=(qeh)
source=('git://github.com/sandsmark/qeh.git')
md5sums=('SKIP')

pkgver() {
  cd qeh
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../qeh \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -vDm 644 ../qeh/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
