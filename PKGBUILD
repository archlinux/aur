# Maintainer: Max Bruckner
_basename=supertux
pkgname=$_basename-old
pkgver=0.1.3
pkgrel=9
pkgdesc="Jump and run game inspired by Super Mario Bros. Milestone 1 release."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://supertux.lethargik.org"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image')
source=("https://github.com/SuperTux/supertux/releases/download/v0.1.3/$_basename-$pkgver.tar.bz2")
sha512sums=('75848583f9f9b9d0f36fec77812501875420fde8befe1ff9ac4ea7613f4d9464b2eb460c2ed89b4dc31e697fbb449a5431c72675e2820d13f5c42653dc07ad98')

build() {
  cd "$srcdir/$_basename-$pkgver"
  CXXFLAGS="-std=c++03" ./configure --prefix=/usr
  sed -i -e 's/Menu:://g' src/menu.h    #fix build error
  sed -i -e 's/supertux.png/supertux-old.png/g' supertux.desktop    #prevent conflict with supertux2
  make
}


package() {
  cd "$srcdir/$_basename-$pkgver"
  make DESTDIR="$pkgdir" install
  mv ${pkgdir}/usr/share/pixmaps/supertux{,-old}.png #prevent conflict with supertux2
}
