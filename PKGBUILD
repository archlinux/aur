# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-icons-git
_pkgname=cutefish-icons
pkgver=0.8.r1.g9b1febc1
pkgrel=1
pkgdesc="System default icon theme of CutefishOS"
arch=('any')
url="https://github.com/cutefishos/icons"
license=('GPL')
groups=('cutefish-git')
depends=()
makedepends=('extra-cmake-modules' 'ninja' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd icons
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd icons

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons
  DESTDIR="$pkgdir" ninja install
}
