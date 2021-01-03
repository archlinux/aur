# Maintainer: NicolasB
# Contributors: carstene1ns, jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=0.10.1
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('gtk3' 'sdl2_mixer' 'sdl2_image')
makedepends=('cmake' 'python-pip' 'python-protobuf')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/${pkgver}.tar.gz")
sha256sums=('98144d0a66a1fe8f0529d0b973dd70d72915dbe3602f5cb58e7fb555e8be81a2')

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
