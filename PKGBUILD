# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-copier
pkgver=4.0.2
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/99/26/ad71fc94760766808ada713bb1a83a509e141984f89e465927e7d237b394/copier-${pkgver}.tar.gz")
sha256sums=('d4af341c1aae2c3e472543858d645ed8a9903ad6dd02de84446441af4b445278')

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