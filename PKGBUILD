# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=timbl
pkgname=timbl-git
pkgver=1
pkgrel=3
pkgdesc="Tilburg Memory-Based Learner, implementations of k-nearest neighbour classification "
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/timbl"
license=('GPL')
depends=('gcc-libs' 'libxml2' 'ticcutils')
makedepends=('libtool' 'autoconf')
provides=('timbl')
conflicts=('timbl')
options=(!libtool)
source=("git://github.com/proycon/timbl.git")
_gitname=("timbl")
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

