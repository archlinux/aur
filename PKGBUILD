# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=dataprep
pkgname=python-${_base}
pkgver=0.4.4
pkgrel=1
pkgdesc="A low code data preparation library in python."
arch=('any')
url="https://github.com/sfu-db/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-nose' 'python-jsonschema4.17')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('e7ef684dba568ed4a19bfcd4459bc0d241f378219440e01da5544e4229b99c2dd474a03a55491fa5f967247af31b216f13fa9ff0a8653df5a7fbdb294d357ec9')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
