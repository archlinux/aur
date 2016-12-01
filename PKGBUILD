# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=advanced-strategic-command
pkgver=2.6.1
pkgrel=1
pkgdesc="A free, turn-based strategy game, designed in the tradition of the Battle Isle series from Bluebyte"
arch=('i686' 'x86_64')
url="http://asc-hq.org/"
license=('GPL2')
depends=("sdl" "sdl_image" "sdl_mixer" "sdl_sound" "libsigc++"
         "lua" "physfs" "boost-libs" "expat" "freetype2" "wxgtk"
         "xvidcore"
         "loki-lib")
makedepends=("boost" "zip")
source=("https://downloads.sourceforge.net/project/asc-hq/ASC%20Source/$pkgver/asc-${pkgver}.0.tar.bz2"
        "http://www.asc-hq.org/music/frontiers.ogg"
        "http://www.asc-hq.org/music/time_to_strike.ogg"
        "http://www.asc-hq.org/music/machine_wars.ogg")
md5sums=('b8668c378e730e982458d5c082e7e0ca'
         'c27415246734d59e27e6a786ee4820d2'
         '0f4de5275ab649f4426d110840e3e1ea'
         'b4421ddd67a9e44d90a49a1d8bdf44c3')

prepare() {
  cd "$srcdir/asc-${pkgver}.0"
  # Music files are provided separately by upstream.
  cp "$srcdir"/*.ogg data/music/
}

build() {
  cd "$srcdir/asc-${pkgver}.0"
  ./configure --prefix=/usr
  # Recent versions of ligsigc++ require C++11.  Overring CXXFLAGS
  # prevents the program from building, so we override CXX instead.
  make CXX="g++ -std=c++11"
}

package() {
  cd "$srcdir/asc-${pkgver}.0"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
