# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=qspng-git
pkgver=r26.a68658f
pkgrel=1
pkgdesc='Qt image plugin using libspng for fast PNG decoding'
arch=('i686' 'x86_64')
url='https://invent.kde.org/sandsmark/qspng'
license=('LGPL')
depends=('qt5-base' 'libspng')
makedepends=('git' 'cmake')
conflicts=(qspng)
provides=(qspng)
source=('git+https://invent.kde.org/sandsmark/qspng.git')
md5sums=('SKIP')

pkgver() {
  cd qspng
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd qspng
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_MAJOR_VERSION=5 .
  make
}

package() {
  cd qspng
  make DESTDIR="$pkgdir" install
}
