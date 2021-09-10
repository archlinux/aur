# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=1.3.0
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
sha512sums=('33ca61cc10e5ce7451c2a18a6de6b4f005d1176fe2d4c058d1eec4c8e22f687773dbc62ef6def6b09c739047511c214affba2d13b10df59d4e6afaee6fbb3242')

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
