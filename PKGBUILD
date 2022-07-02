# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.4.0
pkgrel=1
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server jupyter-notebook-shim)
makedepends=(python-build python-installer)
checkdepends=(python-pytest-tornasync)
conflicts=(jupyter-notebook)
provides=(jupyter-notebook)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('dfdab838f41d60f4d66b4af143cea250d32a0fa8573116921ea6532d1710aa27')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pipname-$pkgver
  pytest -v
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
