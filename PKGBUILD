# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=python38-ipython-genutils
_name=python38-ipython_genutils
pkgver=0.2.0
pkgrel=1
pkgdesc='Vestigial utilities from IPython'
arch=(any)
url='http://ipython.org/'
license=(BSD)
depends=(python38)
makedepends=(python38-build python38-installer python38-setuptools python38-wheel)
checkdepends=(python38-nose)
source=("https://files.pythonhosted.org/packages/source/i/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  nosetests
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
