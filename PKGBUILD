# Maintainer: Christoph W <c w e g e n e r at gmail dot com>

pkgbase=('python-requests-credssp')
pkgname=('python-requests-credssp' 'python2-requests-credssp')
_module='requests-credssp'
pkgver='0.0.2'
pkgrel=2
pkgdesc="HTTPS CredSSP authentication with the requests library."
url="https://github.com/jborean93/requests-credssp"
makedepends=('python-setuptools' 'python2-setuptools')
license=('ISC')
arch=('any')
source=("https://pypi.python.org/packages/76/64/c64dd2be7cc94f1fbf43c9396bac2cbe8448fe1b433b96d3c713b714839e/requests-credssp-${pkgver}.zip")
md5sums=('e6dcd38d10c0f8361b88f19a5f941818')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-requests-credssp() {
    depends+=('python' 'python-pyopenssl' 'python-requests' 'python-ordereddict' 'python-ntlm-auth')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-requests-credssp() {
    depends+=('python2' 'python2-pyopenssl' 'python2-requests' 'python2-ordereddict' 'python2-ntlm-auth')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
