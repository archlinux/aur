pkgbase=('python-cvxcanon')
pkgname=('python-cvxcanon')
_module='CVXcanon'
pkgver='0.1.1'
pkgrel=1
pkgdesc="C++ library to convert high-level optimization problems into canonical form."
url="https://github.com/cvxgrp/CVXcanon"
depends=('python'
    'python-numpy'
    'python-scipy')
makedepends=('python-setuptools'
    'swig'
    'eigen')
license=('unknown')
arch=('i686' 'x86_64')
source=("https://github.com/cvxgrp/CVXcanon/archive/v${pkgver}.tar.gz"
    "use_system_eigen.patch")
md5sums=('ea900f44c30596d96999aa61eab89f08'
         'ee7c698d9fb8bdd767c96015850a6869')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < ../../use_system_eigen.patch
    rm -rf include
}    

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
