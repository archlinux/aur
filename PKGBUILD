# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade-git
pkgver=3.1.0.2.r20.g172b236
pkgrel=1
pkgdesc="SLADE3 Doom editor."
arch=('i686' 'x86_64')
url="http://slade.mancubus.net/"
license=('GPL')
depends=('fluidsynth' 'freeimage' 'ftgl' 'libmodplug' 'sfml' 'wxgtk>=3.0')
makedepends=('cmake' 'git' 'imagemagick' 'zip')
conflicts=('slade')
provides=('slade')
source=(slade::git://github.com/sirjuddington/SLADE.git \
        slade.desktop)
md5sums=('SKIP'
         '49eb1692463e2aa93ea2754a5df7a6e4')

pkgver() {
  cd slade
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd slade

  cmake -DCMAKE_CXX_FLAGS=-DNDEBUG \
        .
  make

  convert "slade.ico[0]" slade.png
}

package() {
  cd slade

  install -Dm755 slade "$pkgdir/usr/bin/slade"
  install -Dm644 slade.pk3 "$pkgdir/usr/share/slade3/slade.pk3"

  install -Dm644 slade.png "$pkgdir/usr/share/pixmaps/slade.png"
  install -Dm644 "$srcdir/slade.desktop" "$pkgdir/usr/share/applications/slade.desktop"
}
