# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=fiat-git
pkgdesc="Supports generation of arbitrary order instances of the Lagrange elements on lines, triangles, and tetrahedra."
pkgver=20140214
pkgrel=1
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/fiat"
license=('LGPL')
groups=('fenics-git')
depends=('python2' 'python2-scientificpython')
provides=('fiat')
conflicts=('fiat')
options=(!emptydirs)
source=("fiat::git+https://bitbucket.org/fenics-project/fiat.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
    cd fiat
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
    cd fiat
    find ./ -name "*" -type f -exec \
        sed -i 's|^#!.*python$|#!/usr/bin/python2|' {} \;
}

build() {
    cd fiat
    python2 setup.py build
}

package() {
    cd fiat
    python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
