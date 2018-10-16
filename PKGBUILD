# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=gnucap-python
pkgname=$_pkgname-git
pkgver=r113.a04f8b3
pkgrel=1
pkgdesc="Python bindings for Gnucap"
arch=('x86_64')
url="https://gitlab.com/gnucap/gnucap-python/blob/master/README"
license=('GPL')
depends=('gnucap' 'python' 'swig')
makedepends=('git')
provides=('gnucap-python')
conflicts=('gnucap-python')
source=("git+https://gitlab.com/gnucap/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    ./bootstrap
    ./configure --prefix=/usr CPPFLAGS=-I/usr/lib/python3.7/site-packages/numpy/core/include/ PYTHON=python3
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

