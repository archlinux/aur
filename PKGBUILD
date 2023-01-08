# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.com>
# Contributor: gyo <nucleogeek@gmail.com>

pkgname=sdl2_pango
pkgver=2.1.5
pkgrel=1
pkgdesc="Connects Pango to SDL2"
arch=("x86_64")
url="https://github.com/markuskimius/SDL2_Pango"
license=("LGPL")
depends=("pango" "freetype2" "sdl2")
makedepends=("git")
_commit=3afd884fddf8d81dbe2c140135deea0c79de31c1
source=("sdl2_pango-$_commit::git+$url.git#commit=$_commit" "freetype2.patch")
sha256sums=(SKIP SKIP)

prepare() {
  cd "$srcdir/$pkgname-$_commit"
  patch -Np1 < "../freetype2.patch"
}

build() {
  cd "$srcdir/$pkgname-$_commit"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_commit"
  make DESTDIR="$pkgdir" install
}
