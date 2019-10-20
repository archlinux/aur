# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=userpath
_sha256sum=10fa2a90c61546f188989680a9b7510888b976f5d18503ad4482c8f919e783cb

pkgname=python-userpath
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform tool for adding locations to the user PATH, no elevated privileges required!"
arch=('any')
url="https://github.com/ofek/userpath"
license=('MIT' 'APACHE')
depends=(
  'python-click'
)
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  "${_sha256sum}"
)

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # no need to include tests files
  rm tests/__init__.py
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
