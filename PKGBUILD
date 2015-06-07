# Maintainer: SebRmv <sbriais at-symbol free dot fr>
pkgname=virtualjaguar-git
pkgver=r497.40e59fa
pkgrel=1
pkgdesc="A portable Atari Jaguar emulator"
arch=('i686' 'x86_64')
url=http://icculus.org/virtualjaguar/
license=('GPL')
depends=('qt4' 'gcc' 'gdb' 'sdl' 'zlib' 'libcdio' 'freeglut')
makedepends=('git')
provides=('virtualjaguar')
conflicts=('virtualjaguar' 'virtualjaguar-svn')
source=('virtualjaguar::git+http://shamusworld.gotdns.org/git/virtualjaguar')
sha1sums=(SKIP)

_gitname='virtualjaguar'

build() {
  msg "Starting build..."

  cd "$srcdir"
  rm -rf "$_gitname-build"
  cp -r "$_gitname" "$_gitname-build"

  cd "$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin/
  cp virtualjaguar $pkgdir/usr/bin/virtualjaguar
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
