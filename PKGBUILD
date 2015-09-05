# Maintainer: Ainola
# Contributor: Ner0
# Contributor: quantax

pkgname=ags-git
pkgver=3.3.4.1.7.geeb96c4
pkgrel=2
pkgdesc="Adventure Game Studio, a development tool that is primarily used to create graphical adventure games"
arch=('i686' 'x86_64')
url="https://github.com/adventuregamestudio/ags"
license=('Artistic2.0')
depends=('allegro4' 'dumb' 'freetype2' 'libogg' 'libtheora' 'libvorbis')
makedepends=('git' 'wxgtk')
optdepends=('wine: for installing and configuring the game')
conflicts=('ags')
install=ags.install
source=('git://github.com/adventuregamestudio/ags.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ags"
  echo $(git describe --tags | sed s'/v\.//;s/-/./g')
}

prepare() {
  cd "$srcdir/ags"
  sed -i 's/-Wfatal-errors\ //' Engine/Makefile-defs.linux
  git submodule update --init
}

build() {
  cd "$srcdir/ags"

  make -C Engine

# cd Manual/
# ./compile_documentation_unix.sh
}

package() {
  install -Dm755 "$srcdir/ags/Engine/ags" "$pkgdir/usr/bin/ags"

  install -Dm644 "$srcdir/ags/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

# install -dm755 "$pkgdir/usr/share/doc/$pkgname/html"
# install -m644 "$srcdir/ags/Manual"/*.htm "$pkgdir/usr/share/doc/$pkgname/html/"
}

# vim:set ts=2 sw=2 et:
