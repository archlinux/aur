# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=ta
pkgname=python-${_base}
pkgver=0.11.0
pkgrel=2
pkgdesc="A Technical Analysis library for financial time series datasets."
arch=('any')
url="https://github.com/bukosabino/${_base}"
license=(MIT)
depends=('python' 'python-numpy' 'python-pandas')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('9d596ea586b748399339be237a47b34ac22f4882b57fd47c3a48b77a3360c066cea9f2f232b1fb8323e1c33559e8ff6e0cd19da2b323be573dade3395f5b45ce')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
