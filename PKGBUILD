# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=timblserver
pkgname=timblserver-git
pkgver=1
pkgrel=2
pkgdesc="Tilburg Memory Based Learner Server."
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/timbl/"
license=('GPL')
depends=('timbl')
makedepends=('libtool' 'autoconf')
provides=('timblserver')
conflicts=('timblserver')
options=(!libtool)
source=("git://github.com/proycon/timblserver.git")
_gitname=("timblserver")
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

