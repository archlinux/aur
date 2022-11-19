# Maintainer:

pkgname=python38-pyproject-metadata
pkgver=0.6.1
pkgrel=1
pkgdesc='PEP 621 metadata parsing'
arch=(any)
url='https://github.com/FFY00/python-pyproject-metadata'
license=(MIT)
depends=(python38-packaging)
makedepends=(python38-build python38-installer python38-setuptools python38-wheel)
checkdepends=(python38-pytest)
source=(https://github.com/FFY00/python-pyproject-metadata/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('4af84f9534a5c71e192e1355e1e99f99e82b97d01411c011ed2f1dff579a7420a0f5d982eea5a032de8549c14191b64334c8e2aeea22fe767837e662e8d8b588')

build() {
  cd $pkgname-$pkgver

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver

  pytest -v
}

package() {
  cd $pkgname-$pkgver

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
