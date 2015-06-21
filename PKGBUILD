# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

_pkgname=frog
pkgname=frog-git
pkgver=1
pkgrel=3
pkgdesc="Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch. It includes a tokenizer, part-of-speech tagger, lemmatizer, morphological analyser, named entity recognition, shallow parser and dependency parser."
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/frog"
license=('GPL3')
depends=('ticcutils' 'ucto' 'libfolia' 'icu' 'libxml2' 'python2' 'frogdata' 'timbl' 'mbt')
provides=('frog')
conflicts=('frog')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=("git://github.com/proycon/frog.git")
_gitname=("frog")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    bash bootstrap.sh || return 1
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-python=/usr/bin/python2 || return 1
    make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}

