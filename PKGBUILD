# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-settings-git
_pkgname=piscesde-settings
pkgver=0.9
pkgrel=1
pkgdesc="System Settings application for piscesDE"
arch=('x86_64')
url="https://github.com/piscesys/settings"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libpiscesde-git' 'modemmanager-qt' 'networkmanager-qt')
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
