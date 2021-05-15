# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=mrboom
pkgver=5.2
pkgrel=1
pkgdesc="Mr.Boom is a 8 players Bomberman clone"
arch=('i686' 'x86_64')
conflicts=('mrboom')
provides=('mrboom')
url="http://mrboom.mumblecore.org"
license=('GPL2')
makedepends=('git' 'libmodplug' 'sdl2')
depends=('sdl2_mixer' 'minizip')
source=(https://github.com/Javanaise/mrboom-libretro/releases/download/$pkgver/MrBoom-src-$pkgver.tar.gz
#"mrboom::git+https://github.com/Javanaise/mrboom-libretro#tag=${pkgver}"
		'mrboom.desktop'
		'mrboom.svg')
sha256sums=('45da5386be8407fef7e979e69020f365c9ce58b506ccca91676230e75eb02032'
            '9903e26eccda473d9ad9bf047161065014c32d97ac74a62f849a8520d80326a5'
            '6f5e6229fe33d81b9f484f5f90778c730fa5f57fb36101233c0b76efdd2b8436')

build() {
  cd "$srcdir/MrBoom-src-$pkgver"
  make PREFIX=/usr mrboom LIBSDL2=1
}

package() {
  cd "$srcdir/MrBoom-src-$pkgver"

  # Install main binary
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man"
  install -d "$pkgdir/usr/share/doc"
  make PREFIX=/usr/share DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/share/bin/mrboom" "$pkgdir/usr/bin/mrboom"
  rm -rf "$pkgdir/usr/share/bin"
  
  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/mrboom.desktop"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/pixmaps/mrboom.svg"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"

}

