# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=userpath

pkgname=python-userpath
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform tool for adding locations to the user PATH, no sudo/runas required!"
arch=('any')
url="https://github.com/ofek/userpath"
license=('MIT' 'APACHE')
depends=(
  'python-click'
)
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/24/7b/3b991e87d08211a95bafcadc370cb17e75a7dfb51e6f9ce9247f8cfff4c0/userpath-${pkgver}.tar.gz"
)
sha256sums=(
  'c4aa4b20298d14272e2a39047a38a7e2195c1d697dd37dec247e2331067e7f31'
)

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  # no need to include tests files
  rm tests/__init__.py
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
