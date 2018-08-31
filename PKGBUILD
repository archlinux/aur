# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-social-auth-core
pkgname=(${pkgbase} 'python2-social-auth-core')
pkgver=1.7.0
pkgrel=1
pkgdesc='Core component of the python-social-auth ecosystem'
arch=('any')
url='https://github.com/python-social-auth/social-core'
license=('BSD')
makedepends=('python-setuptools' 'python-defusedxml' 'python-pyjwt' 'python-pyjwkest' 'python-requests-oauthlib'
               'python-openid' 'python-cryptography' 'python3-saml'
             'python2-setuptools' 'python2-defusedxml' 'python2-pyjwt' 'python2-pyjwkest' 'python2-requests-oauthlib'
               'python2-openid' 'python2-cryptography' 'python2-saml')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/python-social-auth/social-core/archive/${pkgver}.tar.gz")
sha256sums=('c12480159bc7a8ed5d71627103e70cbe8ce63af1bf6f4f1d265d8e9b6c58c39c')

prepare() {
    cp -r social-core-${pkgver} social-core-${pkgver}-python2
}

build() {

    cd ${srcdir}/social-core-${pkgver}
    python setup.py build

    cd ${srcdir}/social-core-${pkgver}-python2
    python2 setup.py build

}

package_python-social-auth-core() {

    depends=('python-defusedxml' 'python-pyjwt' 'python-pyjwkest' 'python-requests-oauthlib'
             'python-openid' 'python-cryptography' 'python3-saml')

    cd social-core-${pkgver}
    python setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/social-core-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

package_python2-social-auth-core() {

    depends=('python2-defusedxml' 'python2-pyjwt' 'python2-pyjwkest' 'python2-requests-oauthlib'
             'python2-openid' 'python2-cryptography' 'python2-saml')

    cd social-core-${pkgver}-python2
    python2 setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/social-core-${pkgver}-python2/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
