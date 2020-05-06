# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-copier
pkgver=3.0.6
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/64/3b/4f010ed6621ce9ad87a1e93f3305b7573eda619cdec0ad8c402de7464f81/copier-${pkgver}.tar.gz")
sha256sums=('848b639ae5bef036e50a051cd2f5db26ee1c8205055b805fbe6e098d03cd4be2')

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