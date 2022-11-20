# Maintainer:

pkgname=python38-hatch-fancy-pypi-readme
pkgver=22.8.0
pkgrel=1
pkgdesc='Fancy PyPI READMEs with Hatch'
arch=(any)
url='https://github.com/hynek/hatch-fancy-pypi-readme'
license=(MIT)
depends=(python38-hatchling)
makedepends=(python38-build python38-installer)
checkdepends=(python38-pytest python38-wheel)
source=(https://github.com/hynek/hatch-fancy-pypi-readme/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4563ec6793d10b076f6f2e5a4ab576b6005ac0ed15b5ed108b62901e82880685')

build() {
  cd hatch-fancy-pypi-readme-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd hatch-fancy-pypi-readme-$pkgver
  PYTHONPATH="$PWD"/src \
  pytest -v
}

package() {
  cd hatch-fancy-pypi-readme-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
