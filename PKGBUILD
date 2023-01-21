pkgname=piscesys-settings-git
_pkgname=piscesys-settings
pkgver=0.9
pkgrel=1
pkgdesc="System Settings application for piscesys Desktop"
arch=('x86_64')
url="https://gitlab.com/piscesys/settings"
license=('GPL')
depends=('piscesys-fishui-git' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libpiscesys-git' 'modemmanager-qt' 'networkmanager-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-settings-git")
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
