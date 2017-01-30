# Maintainer: Manuel Schneider  <manuelschneid3r at googles mail>
pkgname=albert
pkgver=0.9.2
pkgrel=1
pkgdesc="A DE agnostic omnilauncher."
arch=('i686' 'x86_64')
url="https://github.com/ManuelSchneid3r/albert"
license=('GPL')
depends=('qt5-base' 'libx11' 'muparser' 'qt5-x11extras' 'qt5-svg')
makedepends=('cmake' 'qt5-base' 'qt5-tools')
provides=('albert')
conflicts=('albert-git')
source=(https://github.com/ManuelSchneid3r/albert/archive/v${pkgver}.tar.gz)
noextract=()
md5sums=('4369f613b4cc82fb70862aea9b9f1aec')

build() {
  echo -e "\e[41;20;1mIf you plan to report bugs please modify the PKGBUILD to build the debug version.\e[0m"

  [[ -d "${pkgname}-${pkgver}/build" ]] || mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"

  # If you want a debug build, change CMAKE_BUILD_TYPE to 'Debug'
  cmake ".." -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install | grep -v '^-- '
}

# vim:set ts=2 sw=2 et:
