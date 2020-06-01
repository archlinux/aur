# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=gnucap-python
pkgname=$_pkgname-git
pkgver=r248.45a4914
pkgrel=1
pkgdesc='Python bindings for Gnucap'
arch=('x86_64')
url='https://codeberg.org/gnucap/gnucap-python/src/branch/develop/README'
license=('GPL')
depends=('gnucap' 'python-scipy' 'swig3')
makedepends=('git')
provides=('gnucap-python')
conflicts=('gnucap-python')
source=("git+https://codeberg.org/gnucap/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    ./bootstrap
    ./configure --prefix=/usr \
                CPPFLAGS=-I/usr/lib/python3.8/site-packages/numpy/core/include/ \
                PYTHON=python3 \
                SWIG=/usr/bin/swig-3
    make
}

check() {
    cd $_pkgname
    make check
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir/" install
}

