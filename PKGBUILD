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
source=("https://pypi.python.org/packages/2b/97/ed61c71fe40f626143c0b2e34e9c1dc60d91116fd8bae94cd9579daf52d0/cozy_management-0.0.21.tar.gz")
sha256sums=('ad0c6aaff8a1f563d825c9c56b5919f6c7d18bcac015ca40cc9977f363c82f4f')

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
