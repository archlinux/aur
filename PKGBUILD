# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-wallpapers-git
_pkgname=piscesde-wallpapers
pkgver=0.9
pkgrel=1
pkgdesc="piscesDE's system wallpaper"
arch=('any')
url="https://github.com/piscesys/wallpapers"
license=('GPL')
groups=('piscesde-git')
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
