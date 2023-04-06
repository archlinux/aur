# Maintainer: David Runge <dave@sleepmap.de>
_name=kaptan
pkgname=python-kaptan
pkgver=0.5.12
pkgrel=8
pkgdesc="Configuration manager in your pocket"
arch=('any')
url="https://emre.github.io/kaptan/"
license=('BSD')
depends=('python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('fccf767749e9473947bd7cb493ddb30f7dc1b2e10ce932ca327ae3423bc023fa9c76910ac249269ee546eb9162e4ce151e2ad0b9685d888854a7185c855ae143')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  PYTHONPATH=. pytest
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
  install -vDm 644 {AUTHORS,README.rst} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
