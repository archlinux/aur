# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=('cozy-management')
_module='cozy_management'
pkgver='0.0.19'
pkgrel=1
pkgdesc="Module to help self hosted cozy management"
url="https://github.com/cozy/python_cozy_management"
depends=('python2')
makedepends=('python2-setuptools')
license=('LGPL')
arch=('any')
source=("https://pypi.python.org/packages/source/c/cozy-management/cozy_management-${pkgver}.tar.gz")
md5sums=('e188da6b318d0f2e88b677cbf9f6ceb2')

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
