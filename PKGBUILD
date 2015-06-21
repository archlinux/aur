# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=libfolia
pkgname=libfolia-git
pkgver=1
pkgrel=2
pkgdesc="C++ library for FoLiA (Format for Linguistic Annotation)"
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/"
license=('GPL')
depends=('ticcutils' 'icu' 'libxml2')
provides=('libfolia')
conflicts=('libfolia')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/proycon/libfolia.git")
_gitname=("libfolia")
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

