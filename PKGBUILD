# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=autoscraper
pkgname=python-${_base}
pkgver=1.1.14
pkgrel=3
pkgdesc="A smart, automatic, fast and lightweight web scraper for Python"
arch=('any')
url="https://github.com/alirezamika/${_base}"
license=(MIT)
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('858aebc1163dd2d74433dff3cc0fba25d3a64b052c32842a5f0da2e305df3771d99292bc281a04120587a1dcf3cf386831b4d235114c1e4ea95c77ef25b6c5a3')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
