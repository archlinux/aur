#Maintainer: Maarten van Gompel <proycon at anaproy dot nl>

_pkgname=colibri-core
pkgname=${_pkgname}-git
pkgver=735
pkgrel=2
pkgdesc='Colibri Core is a set of command-line tools as well as a C++ library (with Python binding) for NLP. It enables you to work with basic linguistic constructions such as n-grams and skipgrams in a quick and memory-efficient way.'
arch=('i686' 'x86_64')
url="https://proycon.github.io/colibri-core"
license=('GPL')
depends=('gcc-libs' 'python' 'python-setuptools' 'cython' 'bzip2')
makedepends=('git' 'libtool' 'autoconf')
optdepends=('libfolia: FoLiA input support')
provides=("${_pkgname}")
source=("git://github.com/proycon/colibri-core.git")
_gitname=("colibri-core")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    sh bootstrap 
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
    make 
    python setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install 
    python setup.py install --prefix=/usr/ --root="${pkgdir}" --optimize=1
}

