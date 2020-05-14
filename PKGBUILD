# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-copier
pkgver=3.1.0
pkgrel=1
pkgdesc='Library and command-line utility for rendering projects templates'
arch=('x86_64')
url='https://github.com/pykong/copier'
license=('MIT')
depends=('python'
		 'python-yaml'
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/72/1e/5af825bc74cab8434828708cd0a0f3e3e53bda12716a3e4e17a190f27267/copier-${pkgver}.tar.gz")
sha256sums=('5ccee68ea6510c617c207a64354737a3c7726fbca1de950aab3bbf87cde7b4f6')

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