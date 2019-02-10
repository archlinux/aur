# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Aetf <aetf@unlimitedcodeworks.xyz>

_name=globus-sdk
pkgname=python-globus-sdk
pkgver=1.7.0
pkgrel=1
pkgdesc="This SDK provides a convenient Pythonic interface to Globus REST APIs, including the Transfer API and the Globus Auth API."
arch=('any')
url="https://github.com/globus/globus-sdk-python"
license=('Apache')
depends=('python' 'python-six' 'python-requests' 'python-pyjwt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b8adcbe355c2baf610e9f5751967d7e910fa48604b39d6d2f083750a7a805a64')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # don't install tests package
  sed -sie 's/find_packages()/find_packages(exclude=["tests.*", "tests"])/' setup.py
}

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

