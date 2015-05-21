# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade
pkgver=3.1.0.2
pkgrel=1
pkgdesc="SLADE3 Doom editor."
arch=('i686' 'x86_64')
url="http://slade.mancubus.net/"
license=('GPL')
depends=('fluidsynth' 'freeimage' 'ftgl' 'libmodplug' 'sfml' 'webkitgtk2' 'wxgtk>=3.0')
makedepends=('cmake' 'imagemagick' 'zip')
source=(https://github.com/sirjuddington/SLADE/archive/$pkgver.tar.gz
        slade.desktop)
md5sums=('c7f86e7353f3b8d2dccb762161ddabae'
         '49eb1692463e2aa93ea2754a5df7a6e4')

build() {
  cd SLADE-$pkgver

  cmake -DCMAKE_CXX_FLAGS=-DNDEBUG \
        .
  make

  convert "slade.ico[0]" slade.png
}

package() {
  cd SLADE-$pkgver

  install -Dm755 slade "$pkgdir/usr/bin/slade"
  install -Dm644 slade.pk3 "$pkgdir/usr/share/slade3/slade.pk3"

  install -Dm644 slade.png "$pkgdir/usr/share/pixmaps/slade.png"
  install -Dm644 "$srcdir/slade.desktop" "$pkgdir/usr/share/applications/slade.desktop"
}
