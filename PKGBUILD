# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-wallpapers-git
_pkgname=cutefish-wallpapers
pkgver=0.4.r4.g9acd305
pkgrel=1
pkgdesc="CutefishOS's system wallpaper"
arch=('any')
url="https://github.com/cutefishos/wallpapers"
license=('GPL')
groups=('cutefish-git')
depends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('cmake' 'ninja' 'git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd wallpapers
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd wallpapers

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd wallpapers
  DESTDIR="$pkgdir" ninja install
}
