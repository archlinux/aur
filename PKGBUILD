# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-editor-qt-git
pkgver=r387.455ec3d
pkgrel=1
pkgdesc="EasyRPG's Game Editor (QT, development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('GPL3')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
makedepends=('git')
depends=('liblcf-git' 'qt5-multimedia')
install="$pkgname.install"
source=(${pkgname%-*}::"git+https://github.com/EasyRPG/Editor-QT.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-*}

  rm -rf build
  mkdir -p build
}

build () {
  cd ${pkgname%-*}/build

  cmake ../
  make
}

package () {
  cd ${pkgname%-*}

  # binary
  install -Dm755 build/bin/EasyRPG_Editor "$pkgdir"/usr/bin/${pkgname%-*}
  # templates
  install -d "$pkgdir"/usr/share/${pkgname%-*}/templates
  install -m644 bin/templates/* "$pkgdir"/usr/share/${pkgname%-*}/templates
}
