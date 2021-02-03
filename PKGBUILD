# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: DavidK <david_king at softhome dot net>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=deutex-git
pkgver=5.2.2.r1.gef1c06a
pkgrel=1
pkgdesc="A WAD file composer for Doom, Heretic, Hexen and Strife"
arch=('i686' 'x86_64')
url="https://github.com/Doom-Utils/deutex"
license=('GPL2')
depends=('libpng')
makedepends=('git' 'asciidoc')
provides=('deutex' 'deutex-devel')
conflicts=('deutex' 'deutex-devel')
source=(git+https://github.com/Doom-Utils/deutex.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/deutex"
  git describe | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
 cd "$srcdir/deutex"
 ./bootstrap
}

build() {
    # Configure
    cd "$srcdir/deutex"
    ./configure  --prefix=/usr

    # Compile and install
    make 
}

package() {
    cd "$srcdir/deutex"
    make DESTDIR="$pkgdir" install
}
