# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.3.3
pkgrel=1
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server jupyter-notebook)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('c332322864a0bf5866dec3149b4863d092178f144749183a704d39f0ebb7947d')

build() {
  cd $_pipname-$pkgver
  python setup.py build 
}

package() {
  cd $_pipname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  mv "$pkgdir"/{usr/,}etc

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
