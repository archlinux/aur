# Maintainer: Andrew Sun <adsun701@ at mail dot com>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

_name=globus-sdk
pkgname=python-globus-sdk
pkgver=3.15.1
pkgrel=1
pkgdesc="This SDK provides a convenient Pythonic interface to Globus REST APIs, including the Transfer API and the Globus Auth API."
arch=('any')
url="https://github.com/globus/globus-sdk-python"
license=('Apache')
depends=('python-cryptography' 'python-six' 'python-requests' 'python-pyjwt' 'python-typing_extensions')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4945db39968cec6382ef0a44fc72ec05a8516113c9f2f6543ec0325fff47ca89')

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

