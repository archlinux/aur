# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=instant-hpc-git
pkgver=1.3.0_20140107
pkgrel=1
pkgdesc="A Python module allowing for instant inlining of C and C++ code in Python"
_branch=instant-1.3.0
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/instant"
license=('LGPL')
groups=('fenics-git')
depends=('python' 'swig')
conflicts=('instant')
provides=('instant')
options=(!emptydirs)
source=("instant::git+https://bitbucket.org/fenics-project/instant.git#tag=${_branch}")
md5sums=('SKIP')

pkgver() {
    cd instant
    echo "$(grep version setup.py | sed 's/.*version = //;s/["|,]//g')_$(git log --format="%cd" --date=short -1 | sed 's/-//g')"
}

prepare() {
    cd instant
    2to3 --output-dir=instant -W -n instant
}

build() {
    cd instant
    python setup.py build
}

package() {
    cd instant
    python setup.py install --root=$pkgdir
}
