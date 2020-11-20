# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-copier
pkgver=5.1.0
pkgrel=1
pkgdesc='Library and command-line utility for rendering projects templates'
arch=('any')
url='https://github.com/pykong/copier'
license=('MIT')
depends=('python-yaml'
         'python-jinja'
         'python-regex'
         'python-plumbum'
         'python-pathspec'
         'python-pydantic'
         'python-colorama'
         'python-packaging'
         'python-pytest-xdist'
         'python-pyyaml-include')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/67/95/911bb7c4e30333312cd372c09423acabe76986968aaa77482b2c479bad1e/copier-5.1.0.tar.gz")
sha256sums=('4afec02c6fa3efcac73e89307a1fddce1b71bf43f2df2adc338b97b89949a59b')

prepare() {
  cd "copier-${pkgver}"
  # Bypass stupid dependency check
  sed -i "14s|0.8.0|0.9.0|" setup.py	
}

build() {
  cd "copier-${pkgver}"
  python setup.py build
}

package() {
  cd "copier-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
