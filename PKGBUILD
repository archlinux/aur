# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=python-textual-enhanced
pkgver=1.6.1
pkgrel=1
pkgdesc="Mildly-opinionated enhancements to Textual"
arch=('any')
url="https://github.com/davep/textual-enhanced"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/t/textual_enhanced/textual_enhanced-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/davep/textual-enhanced/v${pkgver}/LICENSE")
sha256sums=('ec96ad5ef331bb428c71b78922ba635813272c43a18072bce51b12c1089250fa'
            'a0210c75e9deafff2043c596e7824b726304aea6b2b3b8386be59c9b2eca3c20')

build() {
  cd "textual_enhanced-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "textual_enhanced-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
