# Maintainer: Andrew Sun <adsun701@ at mail dot com>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

_name=globus_sdk
pkgname=python-globus-sdk
pkgver=3.46.0
pkgrel=1
pkgdesc="This SDK provides a convenient Pythonic interface to Globus REST APIs, including the Transfer API and the Globus Auth API."
arch=('any')
url="https://github.com/globus/globus-sdk-python"
license=('Apache')
depends=('python' 'python-cryptography' 'python-six' 'python-requests' 'python-pyjwt' 'python-typing_extensions')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('eb5e1a3e724b6afe89277f2e3aed6d4959d7d3c4b05ed51f084eaa60ee6a4d25')

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

