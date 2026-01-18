# Maintainer: vtyulb <vtyulb@vtyulb.ru>

pkgname=kumir2-git
pkgver=19.04.2020
pkgrel=1
pkgdesc="An educational programming language and IDE in Russian schools"
url="https://www.niisi.ru/kumir/index.htm"
arch=('x86_64')
license=('GPL2')
makedepends=('git' 'cmake' 'python')
depends=('qt5-base' 'qt5-svg' 'qt5-x11extras' 'qt5-script' 'qt5-tools')
replaces=("kumir")

build() {
  cd "${srcdir}"
  git clone https://git.niisi.ru/kumir/kumir2.git
  cd "${srcdir}/kumir2"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/" -DUSE_QT=5 ../
  make
}

package() {
  cd "${srcdir}/kumir2/build"
  make DESTDIR="$pkgdir/" install
  sed -i -e 's/kumir2-classic/env QT_QPA_PLATFORM=xcb kumir2-classic/g' "$pkgdir/usr/share/applications/kumir2-classic.desktop"
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib" | true
}
