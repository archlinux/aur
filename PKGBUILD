# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
_gitname=Mesen

pkgname=libretro-mesen-git
pkgver=0.9.7.r227.gefe55a91
pkgrel=1
pkgdesc='Libretro core for high accuracy Mesen NES/Famicom emulator written in C++.'
arch=('x86_64')
url="https://www.mesen.ca/"
license=('GPL3')
groups=('libretro')
depends=('libretro-core-info')
makedepends=('git')
source=("git+https://github.com/SourMesen/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname/Libretro"
  make
}

package() {
  cd "$srcdir/$_gitname/Libretro"
  install -Dm644 "$srcdir/$_gitname/Libretro/mesen_libretro.so" "$pkgdir/usr/lib/libretro/mesen_libretro.so"
}
