#Maintainer: jnanar <info@agayon.be>
_realname=brython
pkgname=python-brython
pkgver=3.11.3
pkgrel=1
pkgdesc="A Python 3 implementation for client-side web programming"
arch=(any)
url="https://brython.info/"
license=('BSD')
depends=('python' 'python-plumbum')
makedepends=('python-build' 'python-hatchling' 'python-installer')
options=(!emptydirs)
provides=('python-brython')
source=("https://github.com/brython-dev/brython/archive/${pkgver}.tar.gz")
sha512sums=('5938fd308c7a9f0f499e98d9b42364d5ffb5dd17315458c9e3d0d0503a264f8d2517e1abf96a49859e273a3e85f68446cd6932c8f109ac2f85970132d6602b6d')


build() {
  cd "$srcdir/$_realname-$pkgver/scripts"
  python make_dist.py
  cd ../setup
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_realname-$pkgver/setup"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

