# Maintainer: David Runge <dave@sleepmap.de>
_name=kaptan
pkgname=python-kaptan
pkgver=0.5.11
pkgrel=1
pkgdesc="Configuration manager in your pocket"
arch=('any')
url="https://emre.github.io/kaptan/"
license=('BSD')
depends=('python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
# pypi sdist doesn't have the tests (yet): https://github.com/emre/kaptan/issues/93
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/emre/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('5be93b47d4d98de1d1979174856db33fd39c763adec2bd6a2709553c4f332cf330a42a64ced9d68aadb3fbf698b3df9379a0255fb2f4aa03321c5b6140d2a66a')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  python setup.py test
}

package_python-kaptan() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # docs
  install -vDm 644 {AUTHORS,CHANGES,README.rst,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
