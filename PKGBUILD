# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=0.6.8
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('sdl2_mixer' 'sdl2_image')
makedepends=('cmake')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/${pkgver}.tar.gz")
sha256sums=('292091a528203de41d186ed910ef36413a8adb3549c4a864fcb3792b9901a6ff')

prepare() {
  cd $pkgname-sdl-$pkgver

  # disable -Werror (aborts build on mere warnings)
  sed 's| -Werror||' -i CMakeLists.txt
}

build() {
  cd $pkgname-sdl-$pkgver

  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DCDOGS_DATA_DIR="/usr/share/cdogs/"
  make
}

package() {
  make DESTDIR="$pkgdir/" install -C $pkgname-sdl-$pkgver
}
