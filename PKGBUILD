# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=dlint

pkgname="python-${_name}"
pkgver=0.5.0
pkgrel=1
pkgdesc="Dlint is a tool for encouraging best coding practices and helping ensure we're writing secure Python code."
arch=('any')
url="https://github.com/duo-labs/dlint"
license=('BSD')
depends=('flake8>=1:3.6.0' 'flake8<1:4.0.0')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  "${url}/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '4dabda6a97cec0dad2cfab985558acf40f2b64a3dce630b748e2fd389143c245'
)

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # We don't need to package tests.
  rm tests/__init__.py
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
