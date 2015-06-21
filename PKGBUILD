# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=wopr
pkgname=wopr-git
pkgver=1
pkgrel=1
pkgdesc="Memory Based Word Predictor/Language Model"
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/"
license=('GPL')
depends=('ticcutils' 'icu' 'libxml2' 'libfolia' 'timbl' 'timblserver')
provides=('wopr')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/proycon/wopr.git")
_gitname=("wopr")
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

