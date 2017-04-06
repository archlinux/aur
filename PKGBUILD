# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=mbtserver
pkgname=mbtserver-git
pkgver=1
pkgrel=1
pkgdesc="Memory Based Tagger Server"
arch=('i686' 'x86_64')
url="http://LanguageMachines.github.io/mbt"
license=('GPL')
depends=('mbt')
makedepends=('libtool' 'autoconf')
provides=('mbtserver')
conflicts=('mbtserver')
options=(!libtool)
source=("git://github.com/LanguageMachines/mbtserver.git")
_gitname=("mbtserver")
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

