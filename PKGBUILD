# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=mathparse
pkgname=python-${_base}
pkgver=0.2.1
pkgrel=1
pkgdesc="A Python library for evaluating natural language mathematical equations."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('1f267c7459dff623c707f7da6e35a31a05eb30eb8bb00b9b4a97c2c17789a0eadd7936be1ad653acba67661dfcc9dd38f314e6a5a5d216dccf77208fdab802fa')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
