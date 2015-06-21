# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=frogdata
pkgname=frogdata-git
pkgver=1
pkgrel=1
pkgdesc="Data for Frog. Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch."
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/"
license=('GPL')
depends=()
provides=('frogdata')
conflicts=('frogdata')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/proycon/frogdata.git")
_gitname=("frogdata")
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

