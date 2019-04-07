# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-editor-qt-git
pkgver=r442.dd516cd
pkgrel=1
pkgdesc="EasyRPG's Game Editor (QT, development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org/editor/"
license=('GPL3')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
depends=('liblcf-git' 'qt5-multimedia')
makedepends=('git' 'ninja')
install=$pkgname.install
source=(${pkgname%-*}::"git+https://github.com/EasyRPG/Editor-QT.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd ${pkgname%-*}

  rm -rf build
  cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package () {
  cd ${pkgname%-*}

  # binary
  DESTDIR="$pkgdir" ninja -C build install
  # templates
  install -d "$pkgdir"/usr/share/${pkgname%-*}/templates
  install -m644 bin/templates/* "$pkgdir"/usr/share/${pkgname%-*}/templates
}
