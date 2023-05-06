# Maintainer: ikolan
# Contributors: carstene1ns, jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=1.4.1
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('gtk3' 'sdl2_mixer' 'sdl2_image')
makedepends=('cmake' 'python-pip' 'python-protobuf')
optdepends=('cdogs-mission-pack: A large collection of user-created campaigns for C-Dogs.')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/${pkgver}.tar.gz")
sha256sums=('99aa698ba652e6b06d0eb18a9de5634dab798abb47beec1533050e33719fad00')

prepare() {
  cd $pkgname-sdl-$pkgver

  # disable -Werror (aborts build on mere warnings)
  sed 's| -Werror||' -i CMakeLists.txt
}

build() {
  cd $pkgname-sdl-$pkgver

  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/share/cdogs \
    -DCDOGS_DATA_DIR="/usr/share/cdogs/"
  make
}

package() {
  make DESTDIR="$pkgdir/" install -C $pkgname-sdl-$pkgver
  mv $pkgdir/usr/share/cdogs/bin/ $pkgdir/usr/bin/
  mv $pkgdir/usr/share/cdogs/share/* $pkgdir/usr/share/
}
