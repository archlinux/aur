# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=('cozy-management')
_module='cozy_management'
pkgver='0.0.23'
pkgrel=1
pkgdesc="Module to help self hosted cozy management"
url="https://github.com/cozy/python_cozy_management"
depends=('python2' 'python2-requests' 'python2-psutil' 'python2-docopt' 'python2-pyopenssl')
makedepends=('python2-setuptools') 
license=('LGPL')
arch=('any')
source=("https://pypi.python.org/packages/07/cf/683044ade6d8ac6a031ef8a944249bcb4d79e8eaad64e3947708d3b1154a/cozy_management-0.0.23.tar.gz")
sha256sums=('9f77758a691425149a9953f0c23c77bdd900894cbd3b3618363d2618d25d2fd7')

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
