# Maintainer: SebRmv <sbriais at-symbol free dot fr>
pkgname=virtualjaguar-git
pkgver=r503.a0fe543
pkgrel=3
pkgdesc="A portable Atari Jaguar emulator"
arch=('i686' 'x86_64')
url=http://icculus.org/virtualjaguar/
license=('GPL')
depends=('qt4' 'gcc' 'gdb' 'sdl' 'zlib' 'libcdio' 'freeglut')
makedepends=('git')
provides=('virtualjaguar')
conflicts=('virtualjaguar' 'virtualjaguar-svn')
source=('virtualjaguar::git+http://shamusworld.gotdns.org/git/virtualjaguar' '0001-Fix-Makefile-qt-5-is-not-a-valid-option-of-recent-qm.patch')
sha1sums=(SKIP '7bbe6bf9cb1c0cd0c09a9b717021058384e07fa2')

_gitname='virtualjaguar'

build() {
  msg "Starting build..."

  cd "$srcdir"
  rm -rf "$_gitname-build"
  cp -r "$_gitname" "$_gitname-build"

  cd "$_gitname-build"
  git apply "$srcdir/0001-Fix-Makefile-qt-5-is-not-a-valid-option-of-recent-qm.patch"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin/
  cp virtualjaguar $pkgdir/usr/bin/virtualjaguar
}

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
