# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='histoprint'
pkgname="python-${_pkgname}"
pkgver='1.6.0'
pkgrel=2
pkgdesc="Pretty print Numpy (and other) histograms to the console."
arch=('any')
url='https://github.com/scikit-hep/histoprint'
license=('MIT')
depends=('python-numpy' 'python-click')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib" python tests/test.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install  --skip-build --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
