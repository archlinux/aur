# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-trustme
_pyname=${pkgname/python38-/}
pkgver=0.9.0
pkgrel=5
pkgdesc='Library for fake certificate authority (CA) to generate fake TLS certs'
url='https://trustme.readthedocs.io'
arch=('any')
license=('MIT')
depends=('python38' 'python38-cryptography' 'python38-idna')
makedepends=('python38' 'python38-setuptools' 'python38-cryptography')
checkdepends=('python38-pytest' 'python38-pyopenssl' 'python38-service-identity')
source=(https://github.com/python-trio/trustme/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c605803d91eaedb7efd1295a2bebfb9cb7723220f325a25f7fe61e8256f3700bf9da0d85f796905a76f317c7eda8261d78a46c64aeabd357854f001f6ba1628e')
b2sums=('970700274ac25b9871b53bba4ddbac2d22bb9db672012fd1216726091c39fd901023c93b9c1b49cb2f90a9610f7f64d76ef9c9a1509282f9bbc944d56a352ff2')

build() {
  cd ${_pyname}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pyname}-${pkgver}
  export PYTHONPATH=$(pwd)
  py.test
}

package() {
  cd ${_pyname}-${pkgver}
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE.MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
