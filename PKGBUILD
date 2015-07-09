# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=instant-git
pkgver=20140523
pkgrel=1
pkgdesc="A Python module allowing for instant inlining of C and C++ code in Python"
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/instant"
license=('LGPL')
groups=('fenics-git')
depends=('python2' 'swig')
conflicts=('instant')
provides=('instant')
options=(!emptydirs)
source=("instant::git+https://bitbucket.org/fenics-project/instant.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
    cd instant
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
    cd instant
    find ./ -name "*" -type f -exec \
        sed -i 's|^#!.*python$|#!/usr/bin/python2|' {} \;
}

build() {
    cd instant
    python2 setup.py build
}

package() {
    cd instant
    python2 setup.py install --root=$pkgdir
}
