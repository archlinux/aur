# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=openxcom-extended
pkgver=7.0.14
# Repo doesn't use tags, so set which commit this version corresponds to in
# https://github.com/MeridianOXC/OpenXcom/commits/oxce-plus/src/version.h
_commit=f5efc8736ff404e59f51d4b2df24cd0fa721a1b3
pkgrel=1
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL3')
depends=('sdl_mixer' 'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'hicolor-icon-theme' 'gcc-libs')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'boost' 'glu' 'cmake' 'xorgproto')
optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
            'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
provides=('openxcom' 'openxcom-git')
conflicts=('openxcom')
install="${pkgname}.install"
source=(openxcom-extended::git+"https://github.com/MeridianOXC/OpenXcom.git#commit=${_commit}")
md5sums=('SKIP')

prepare() {
    mkdir -p openxcom-extended/build
    sed -i 's:openxcom.6 DESTINATION ${CMAKE_INSTALL_PREFIX}/man/man6):openxcom.6 DESTINATION ${CMAKE_INSTALL_PREFIX}/share/man/man6):' openxcom-extended/docs/CMakeLists.txt
}

build() {
  cd openxcom-extended/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DTARGET_PLATFORM="linux" -DCMAKE_BUILD_TYPE="None" -DDEV_BUILD="Off" ..
  make
}

package() {
  cd openxcom-extended/build
  make DESTDIR="${pkgdir}" install
}
