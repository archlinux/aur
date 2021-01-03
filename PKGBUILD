# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=gnucap-python
pkgname=$_pkgname-git
pkgver=r291.86868e8
pkgrel=1
pkgdesc='Python bindings for Gnucap'
arch=('x86_64')
url='https://codeberg.org/gnucap/gnucap-python/src/branch/develop/README'
license=('GPL')
depends=('gnucap' 'python-scipy' 'swig')
makedepends=('git')
provides=('gnucap-python')
conflicts=('gnucap-python')
source=("git+https://codeberg.org/gnucap/$_pkgname.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    ./bootstrap
    ./configure --prefix=/usr \
                PYTHON=python3
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

