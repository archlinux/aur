# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.3.5
pkgrel=1
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server jupyter-notebook)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('99444dd63103af23c788d9b5172992f12caf8c3098dd5a35c787f0df31490c29')

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
