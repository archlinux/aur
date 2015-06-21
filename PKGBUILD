# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=mbt
pkgname=mbt-git
pkgver=1
pkgrel=2
pkgdesc="Memory-based tagger-generator and tagger in one."
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/"
license=('GPL')
depends=('ticcutils' 'timbl' 'timblserver')
provides=('mbt')
conflicts=('mbt')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/proycon/mbt.git")
_gitname=("mbt")
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

