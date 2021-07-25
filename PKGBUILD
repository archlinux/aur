# Maintainer: Nicolas_B
# Contributors: carstene1ns, jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=0.13.0
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('gtk3' 'sdl2_mixer' 'sdl2_image')
makedepends=('cmake' 'python-pip' 'python-protobuf')
optdepends=('cdogs-mission-pack: A large collection of user-created campaigns for C-Dogs.')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/${pkgver}.tar.gz")
sha256sums=('1d51c1d918493761a1d702e6f9bf46409b9ecd0ea98ca4081fc41d355957222a')

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
