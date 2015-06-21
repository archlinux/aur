# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=ucto
pkgname=ucto-git
pkgver=1
pkgrel=2
pkgdesc="An advanced rule-based (regular-expression) and unicode-aware tokenizer for various languages. Tokenization is an essential first step in any NLP pipeline."
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/"
license=('GPL')
depends=('ticcutils' 'icu' 'libxml2' 'libfolia')
provides=('ucto')
conflicts=('ucto')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/proycon/ucto.git")
_gitname=("ucto")
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

