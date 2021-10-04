# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-settings-git
_pkgname=cutefish-settings
pkgver=0.4.r33.ga3da02d
pkgrel=1
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libcutefish-git' 'modemmanager-qt' 'networkmanager-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd settings
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd settings

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings
  make DESTDIR="$pkgdir" install
}
