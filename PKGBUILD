# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-editor-qt-git
pkgver=r308.5b413b5
pkgrel=1
pkgdesc="EasyRPG's Game Editor (QT, development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
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

build () {
  cd ${pkgname%-*}

  qmake-qt5
  make
}

package () {
  cd ${pkgname%-*}/bin

  # binary
  install -Dm755 EasyRPG-Editor "$pkgdir"/usr/bin/${pkgname%-*}
  # templates
  install -d "$pkgdir"/usr/share/${pkgname%-*}/templates
  install -m644 templates/* "$pkgdir"/usr/share/${pkgname%-*}/templates
}
