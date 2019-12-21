# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=diffimg-git
pkgver=r60.0f57743
pkgrel=1
pkgdesc='Qt based GUI to diff images'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/diffimg'
license=('GPL')
depends=('qt5-base' 'qwt')
makedepends=('git')
conflicts=(diffimg)
provides=(diffimg)
source=('git://github.com/sandsmark/diffimg.git')
md5sums=('SKIP')

pkgver() {
  cd diffimg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd diffimg
  qmake
  make
}

package() {
  cd diffimg
  make INSTALL_ROOT="$pkgdir" install
  mv "$pkgdir"/usr/bin/diffimg "$pkgdir"/usr/bin/diffimg-qt
  mv "$pkgdir"/usr/share/man/man1/diffimg.1.gz "$pkgdir"/usr/share/man/man1/diffimg-qt.1.gz
}
