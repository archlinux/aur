# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=openxcom-extended
pkgver=6.4.2
# Repo doesn't use tags, so set which commit this version corresponds to in
# https://github.com/MeridianOXC/OpenXcom/commits/oxce-plus/src/version.h
_commit=41873c2919085d4df4731c41b1fea56e6f182152
pkgrel=1
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL3')
depends=('sdl_mixer' 'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs'
         'glibc' 'hicolor-icon-theme')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'sdl_mixer'
             'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs' 'glibc'
             'boost' 'glu' 'cmake' 'hicolor-icon-theme' 'xorgproto')
optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
            'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
provides=('openxcom' 'openxcom-git')
conflicts=('openxcom')
install="${pkgname}.install"
source=(openxcom-extended::git+"https://github.com/MeridianOXC/OpenXcom.git#commit=${_commit}")
md5sums=('SKIP')

prepare() {
    mkdir -p openxcom-extended/build
}

build() {
  cd openxcom-extended/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release" -DDEV_BUILD="Off" ..
  make
}

package() {
  cd openxcom-extended/build
  make DESTDIR="${pkgdir}" install
}
