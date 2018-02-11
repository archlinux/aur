# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kodi-addon-pvr-sledovanitv-git
pkgver=10.2314115
pkgrel=1
pkgdesc="sledovanitv.cz PVR client addon for Kodi"
arch=('x86_64')
url="https://lf.bukova.info/web/guest/kodi-pvr-for-sledovanitv.cz"
license=('GPL')
depends=('jsoncpp' 'kodi')
makedepends=('cmake' 'git' 'kodi-dev' 'kodi-platform')
provides=('kodi-addon-pvr-sledovanitv')
conflicts=('kodi-addon-pvr-sledovanitv')
options=()
source=("git+https://github.com/PepaRokos/pvr.sledovanitv.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pvr.sledovanitv"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/pvr.sledovanitv"
  sed -i 's|^find_package_handle_standard_args.*|#&|' FindJsonCpp.cmake
}

build() {
  cd "$srcdir/pvr.sledovanitv"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/pvr.sledovanitv"
  make DESTDIR="$pkgdir/" install
}
