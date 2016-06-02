# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=ticcltools
pkgname=ticcltools-git
pkgver=16
pkgrel=1
pkgdesc="Tools for TICCL: A spelling normalisation engine"
arch=('i686' 'x86_64')
url="https://github.com/LanguageMachines/ticcltools"
license=('GPL')
depends=('ticcutils' 'icu' 'libxml2')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/languagemachines/ticcltools.git")
_gitname=("ticcltools")
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

