# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=toad
pkgname=toad-git
pkgver=1
pkgrel=3
pkgdesc="Toad: Trainer Of All Data, the Frog training collection"
arch=('i686' 'x86_64')
url="http://languagemachines.github.io/frog"
license=('GPL3')
depends=('ticcutils' 'ucto' 'libfolia' 'icu' 'libxml2' 'timbl' 'mbt' 'mbtserver' 'frog' 'frogdata')
provides=('toad')
conflicts=('toad')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git+https://github.com/LanguageMachines/toad.git")
_gitname=("toad")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    bash bootstrap.sh || return 1
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var  || return 1
    make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}

