# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=('cozy-management')
_module='cozy_management'
pkgver='0.0.21'
pkgrel=1
pkgdesc="Module to help self hosted cozy management"
url="https://github.com/cozy/python_cozy_management"
depends=('python2' 'python2-requests' 'python2-psutil' 'python2-docopt' 'python2-pyopenssl')
makedepends=('python2-setuptools') 
license=('LGPL')
arch=('any')
source=("https://pypi.python.org/packages/source/c/cozy-management/cozy_management-${pkgver}.tar.gz")
sha256sums=('d3123eec58d605ffd02cf5e1807760f719e9b6c5ab1c4801580a3f938961d081')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    msg 'Fixing for python2 name'
    find -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;

    python2 setup.py install --root="${pkgdir}" --optimize=1
}
