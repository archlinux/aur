# Maintainer: Christoph W <c w e g e n e r at gmail dot com>

pkgbase=('python-ntlm-auth')
pkgname=('python-ntlm-auth' 'python2-ntlm-auth')
_module='ntlm-auth'
pkgver='1.0.2'
pkgrel=2
pkgdesc="Creates NTLM authentication structures"
url="https://github.com/jborean93/ntlm-auth"
makedepends=('python-setuptools' 'python2-setuptools')
license=('LGPL-3.0')
arch=('any')
source=("https://pypi.python.org/packages/ac/99/5183cbb714537e0bd31dd266f2bad894f17112f862bb5c65fd6a5367dd2b/ntlm-auth-${pkgver}.zip")
md5sums=('87e5325975c641bc6fbacca496e96748')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-ntlm-auth() {
    depends+=('python' 'python-six' 'python-ordereddict')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-ntlm-auth() {
    depends+=('python2' 'python2-six' 'python2-ordereddict')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
