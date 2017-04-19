# Maintainer: Christoph W <c w e g e n e r at gmail dot com>
# Maintainer: Gary van der Merwe <g a r y v d m at gmail dot com>

pkgbase=('python-requests_ntlm')
pkgname=('python-requests_ntlm' 'python2-requests_ntlm')
_module='requests_ntlm'
pkgver='1.0.0'
pkgrel=2
pkgdesc="This package allows for HTTP NTLM authentication using the requests library."
url="https://github.com/requests/requests-ntlm"
makedepends=('python-setuptools' 'python2-setuptools')
license=('custom:ISC License (ISCL)')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/requests_ntlm/requests_ntlm-${pkgver}.tar.gz")
md5sums=('62b45ae988960b4363d944ddea3c9a28')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-requests_ntlm() {
    depends+=('python' 'python-requests' 'python-ntlm-auth')
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-requests_ntlm/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-requests_ntlm() {
    depends+=('python2' 'python2-requests' 'python2-ntlm-auth')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python2-requests_ntlm/LICENSE"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
