# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name='flake8-polyfill'
pkgbase="python-${_name}"
pkgname=("${pkgbase}" "python2-${_name}")
pkgver=1.0.2
pkgrel=1
pkgdesc="Polyfill package for Flake8 plugins"
url="https://gitlab.com/pycqa/${_name}"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('076110bed47814d27019a0db25ad481b')

prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-flake8-polyfill() {
  depends+=('flake8')
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-flake8-polyfill() {
  depends+=('python2-flake8')
  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
