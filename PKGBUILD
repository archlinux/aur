# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=1.7.0
pkgrel=1
pkgdesc='Apply black reformatting to Python files only in regions changed since a given commit'
arch=('any')
url=https://github.com/akaihola/darker
license=('BSD')
depends=('python'
         'python-black'
         'python-toml')
makedepends=('python-setuptools')
optdepends=('python-isort: for sorting import statements')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akaihola/darker/releases/download/${pkgver}/darker-${pkgver}.tar.gz")
sha512sums=('be45fa321ca2d74b4151480e2754c6a33f3cc6f9e37e3a8c0592fb4a5cf3a6f01ac4b88a515d7e1e20b4e3691789590e3ab2da4c038f3e5ff02efa4556b7db72')

build() {
  cd "darker-$pkgver"
  python setup.py build
}

package() {
  cd "darker-$pkgver"
  python setup.py install --optimize=1 --root="$pkgdir" --skip-build
  install -vDm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
