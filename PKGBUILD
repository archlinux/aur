# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=ticcutils
pkgname=ticcutils-git
pkgver=201
pkgrel=1
pkgdesc="Common library with functions for tools developed at Tilburg Centre for Cognition and Communication (Tilburg University) and Center of Language and Speech Technology (Radboud University Nijmegen)"
arch=('i686' 'x86_64')
url="https://github.com/LanguageMachines/ticcutils/"
license=('GPL')
depends=('gcc-libs' 'libxml2' 'bzip2' 'libtar' 'boost' 'zlib')
provides=('ticcutils')
conflicts=('ticcutils')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/LanguageMachines/ticcutils.git")
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

