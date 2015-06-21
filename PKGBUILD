# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=ticcutils
pkgname=ticcutils-git
pkgver=161
pkgrel=2
pkgdesc="Common library with functions for tools developed at Tilburg Centre for Cognition and Communication"
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/"
license=('GPL')
depends=('gcc-libs' 'libxml2' 'bzip2' 'libtar' 'boost' 'zlib')
provides=('ticcutils')
conflicts=('ticcutils')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/proycon/ticcutils.git")
_gitname=("ticcutils")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    bash bootstrap.sh || return 1
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
    make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}

