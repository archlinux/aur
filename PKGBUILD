pkgname='python-cvxcanon'
_module='CVXcanon'
pkgver='0.1.2'
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
arch=('x86_64')
source=("https://github.com/cvxgrp/CVXcanon/archive/v${pkgver}.tar.gz"
    "use_system_eigen.patch")
sha256sums=('cf5a506258d9acadfec83529d175027bd9b7c821702c6f28b1eea7cbd61d842b'
            '9bf618a0634bbe855ec67dd0e2b9c1f32528297a5316ec7b0b302932f4de544f')

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
