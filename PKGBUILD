# Maintainer: Vlad Petrov <ejiek@mail.ru>

_pkgname=qmqtt
pkgname=$_pkgname-git
pkgver=r291.508b714
pkgrel=1
pkgdesc="mqtt client for Qt"
arch=("x86_64")
url="https://github.com/emqtt/qmqtt"
license=("Eclipse Public License 1.0" "Eclipse Distribution License 1.0")
depends=("qt5-base")
makedepends=("qt5-tools")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/emqtt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
      cd $_pkgname
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../$_pkgname
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}
