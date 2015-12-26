# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Ainola
# Contributor: Ner0
# Contributor: quantax

pkgname=ags-git
pkgver=3.3.4.2.34.g6edac71
pkgrel=2
pkgdesc="Adventure Game Studio, a development tool that is primarily used to create graphical adventure games"
arch=('i686' 'x86_64')
url="https://github.com/adventuregamestudio/ags"
license=('Artistic2.0')
depends=('allegro' 'dumb' 'libogg' 'libtheora' 'libvorbis')
makedepends=('git' 'wxgtk')
optdepends=('wine: for installing and configuring the game')
conflicts=('ags')
install=ags.install
source=('git://github.com/adventuregamestudio/ags.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ags"
  git describe --tags | sed s'/v\.//;s/-/./g'
}

#prepare() {
#  cd "$srcdir/ags"
#  sed -i 's/-Wfatal-errors\ //' Engine/Makefile-defs.linux
#  git submodule update --init
#}

build() {
  cd "$srcdir/ags"
  make -C Engine
}

package() {
  install -Dm755 "$srcdir/ags/Engine/ags" "$pkgdir/usr/bin/ags"
  install -Dm644 "$srcdir/ags/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


