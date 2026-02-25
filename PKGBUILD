# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: mawcomw <mawcomw@gmail.com>

_base=dj-database-url
pkgname=python-${_base}
pkgver=3.1.2
pkgrel=1
arch=('any')
pkgdesc="Use Database URLs in your Django Application"
url="https://github.com/jazzband/${_base}"
license=('BSD-3-Clause')
depends=(python-django)
makedepends=(python-build python-installer python-wheel python-uv-build)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('97711ea2c4a4280904586840277266db5cae1fb81c07090d2492261f99de61e654e366f191d1b4578881bb9e20ffd72d4aa5a986d8aa3849236c76b767f67006')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}
