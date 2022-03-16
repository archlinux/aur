# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.3.7
pkgrel=1
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server jupyter-notebook-shim)
makedepends=(python-build python-installer)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('36dbaa88ffaf5dc05d149deb97504b86ba648f4a80a60b8a58ac94acab2daeb5')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
