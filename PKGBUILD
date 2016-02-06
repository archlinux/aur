# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: Christopher Pahl <sahib@online.de>
# glyr PKGBUILD for ArchLinux
pkgname=glyr-git
pkgver=1.0.8
pkgrel=1
pkgdesc="A music metadata searchengine utility and library written in C"
arch=('armv7h' 'i686' 'x86_64')
depends=(glib2 curl sqlite3)
provides=('glyr')
conflicts=('glyr')
makedepends=('git' 'cmake')
license=('GPL3')
url="https://github.com/sahib/glyr"
source=('git+https://github.com/sahib/glyr.git#branch=master')
md5sums=('SKIP')

build() {
    cd "$srcdir/glyr"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make glyrc -j4 || return 1
}

package() {
  cd "$srcdir/glyr"
  make DESTDIR=$pkgdir install || return 1
}

pkgver() {
    cd "$srcdir/glyr"
    git tag --sort="-v:refname" | grep '^[0-9]' | head -1
}
